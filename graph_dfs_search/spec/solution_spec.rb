require 'rspec'
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


  # my attempt
  def dfs(graph, node, visited)
    return if visited.include?(node)
    visited << node
    node.neighbours.each do |neighbour|
      dfs(graph, neighbour, visited)
    end
  end

  # correct most performent solution from Reducible https://www.youtube.com/watch?v=PMMc4VsIacU&t=604s
  def dfs_reducible1(graph, node, visited_map)
    visited_map[node.value] = true
    node.neighbours.each do |neighbour|
      dfs_reducible1(graph, neighbour, visited_map) unless visited_map[neighbour.value] == true
    end
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

      # my solution
      visited = []
      dfs(zero, zero, visited )
      expect(visited.map(&:value)).to eq [0, 1, 3, 2, 4]

      # solution by Reducible youtube chanell
      visited_map = {}
      dfs_reducible1(zero, zero, visited_map )
      expect(visited_map.keys).to eq [0, 1, 3, 2, 4]
    end
  end
end
