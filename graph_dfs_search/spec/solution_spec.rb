# Depth First Search (DFS)

require 'rspec/autorun'
require 'irb'


class Node
  attr_reader :value, :neighbours

  def initialize(value)
    @value = value
    @neighbours = []
  end

  def add(n)
    return if neighbours.include?(n)
    neighbours << n
    n.add(self)
    n
  end

  def inspect
    "<Node #{value}>"
  end
end


RSpec.describe 'Depth First Search (DFS) in Ruby' do
  def x

  end

  describe 'small graph' do
    # example at https://youtu.be/PMMc4VsIacU?t=533
    #
    #     1
    #   /   \
    # 0       3 -4
    #   \   /
    #     2
    #
    it do
      zero   = Node.new(0)
      one    = Node.new(1)
      two    = Node.new(2)
      three  = Node.new(3)
      four   = Node.new(4)
      [one, two, three].each do |n|
        zero.add(n)
      end
      one.add(three)
      two.add(three)
      three.add(four)

      expect(zero.neighbours).to match_array([one, two, three])
      expect(three.neighbours).to match_array([four, zero, one, two])
      expect(four.neighbours).to match_array([three])
    end
  end
end
