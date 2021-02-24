require 'rspec'
require 'irb'

module SolutionFloadFill
  extend self

  def flood_fill(image, row, col, new_color)
    start_color = image[row][col]
    queue = [[row, col]]
    visited = []
    until queue.empty?
      row, col = queue.shift
      visited << [row, col]

      image[row][col] = new_color

      neighbours(image, row, col, start_color).each do |r, c|
        queue << [r,c] unless visited.include?([r, c])
      end
    end

    image
  rescue => e
    binding.irb
  end

  def neighbours(image, row, col, start_color)
    indeces = [
      [row - 1, col],
      [row + 1, col],
      [row, col - 1],
      [row, col + 1],
    ]
    indeces.select do |row, col|
      valid?(image, row, col) && image[row][col] == start_color
    end
  end

  def valid?(image, row, col)
    row >= 0 && col >= 0 && row < image.size && col < image.first.size
  end

end

RSpec.describe 'solutions by Reducible youtube chanell' do
  # correct most performent solution from Reducible https://www.youtube.com/watch?v=xlVX7dXLS64
  #
  # 1 0 1 1 0
  # 0 1 0 1 0
  # 1 1 1 1 1
  # 0 0 1 0 1
  # 1 0 0 0 0
  #

  let(:image) do
    [
      [ 1, 0, 1, 1, 0 ],
      [ 0, 1, 0, 1, 0 ],
      [ 1, 1, 1, 1, 1 ],
      [ 0, 0, 1, 0, 1 ],
      [ 1, 0, 0, 0, 0 ]
    ]
  end

  it 'solution' do
    expect(SolutionFloadFill.flood_fill(image, 2, 2, 2)).to eq([
      [ 1, 0, 2, 2, 0 ],
      [ 0, 2, 0, 2, 0 ],
      [ 2, 2, 2, 2, 2 ],
      [ 0, 0, 2, 0, 2 ],
      [ 1, 0, 0, 0, 0 ]
    ])
  end
end
