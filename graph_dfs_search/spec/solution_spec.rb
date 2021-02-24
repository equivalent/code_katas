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
      dfs_reducible1(graph, neighbour, visited_map) unless visited_map[neighbour.value]
    end
  end

  def dfs_reducible2(graph, start_node, visited_map)
    stack = [start_node]
    while stack.size > 0
      current_node = stack.pop
      unless visited_map[current_node.value]
        visited_map[current_node.value] = true
        current_node.neighbours.each do |neighbour|
          stack << neighbour unless visited_map[neighbour.value]
        end
      end
    end
  end


  let(:zero){    Node.new(0) }
  let(:one) {    Node.new(1) }
  let(:two) {    Node.new(2) }
  let(:three){   Node.new(3) }
  let(:four) {   Node.new(4) }
  let(:five) {   Node.new(5) }
  let(:six) {    Node.new(6) }
  let(:seven) {  Node.new(7) }
  let(:eight) { Node.new(8) }
  let(:nine) {   Node.new(9) }




  describe 'small graph' do
    # example at https://youtu.be/PMMc4VsIacU?t=533
    #
    #     1
    #   /   \
    # 0       3 -4
    #   \   /
    #     2
    #
    #
    before do
      [one, two, three].each do |n|
        zero.add(n)
      end
      one.add(three)
      two.add(three)
      three.add(four)
    end

    it 'sanity check if nodes are conneted correctly' do
      expect(zero.neighbours).to match_array([one, two, three])
      expect(three.neighbours).to match_array([four, zero, one, two])
      expect(four.neighbours).to match_array([three])
    end

    it 'my solution' do
      visited = []
      dfs(zero, zero, visited )
      expect(visited.map(&:value)).to eq [0, 1, 3, 2, 4]
    end

    it 'solution by Reducible youtube chanell' do
      visited_map = {}
      dfs_reducible1(zero, zero, visited_map )
      expect(visited_map.keys).to eq [0, 1, 3, 2, 4]
    end

    it 'solution2 by Reducible youtube chanell' do
      visited_map = {}
      dfs_reducible2(zero, zero, visited_map )
      expect(visited_map.keys).to match_array([0, 3, 4, 2, 1])
    end
  end

  describe 'large graph' do
    #
    #     1  -- 4     8 - 9
    #   /    \      / |
    # 0   |   3 ---5  |
    #   \     |     \ |
    #     2   6      7
    #

    before do
      zero.add(one)
      zero.add(two).add(one)

      one.add four
      one.add three

      three.add six
      three.add(five)

      five.add(seven).add(eight)
      five.add(eight)

      eight.add(nine)
    end

    it 'my solution' do
      visited = []
      dfs(zero, zero, visited )
      expect(visited.map(&:value)).to eq [0, 1, 2, 4, 3, 6, 5, 7, 8, 9]
    end

    it 'solution by Reducible youtube chanell' do
      visited_map = {}
      dfs_reducible1(zero, zero, visited_map )
      expect(visited_map.keys).to eq [0, 1, 2, 4, 3, 6, 5, 7, 8, 9]
    end

    it 'solution2 by Reducible youtube chanell' do
      visited_map = {}
      dfs_reducible2(zero, zero, visited_map )
      expect(visited_map.keys).to match_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
