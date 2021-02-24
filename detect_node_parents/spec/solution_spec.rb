require 'rspec/autorun'
require 'irb'


RSpec.describe 'Solution' do

  #   1   2   4
  #    \ /  / | \
  #     3   5 8 9
  #      \ / \   \
  #       6  7   11
  #



  def solution(pairs)
    offsprings = {}
    parents = []
    pairs.each do |parent, child|
      parents << parent

      offsprings[child] ||= []
      offsprings[child] << parent
    end

    [
      (parents - offsprings.keys).uniq,
      offsprings.select { |child, parents| parents.size == 1 }.keys.sort
    ]
  end

  it do
    pairs = [
      [1, 3], [2, 3], [3, 6], [5, 6],
      [5, 7], [4, 5], [4, 8], [4, 9], [9, 11]
    ]



    expect(solution(pairs)).to eq([
      [1, 2, 4],
      [5, 7, 8, 9, 11]
    ])
  end
end
