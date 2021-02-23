require 'rspec/autorun'
require 'irb'

class Node
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
  end
end



RSpec.describe 'Solution' do
  ## alt solution
  #def find_node(node, value)
    #return false unless node
    #return true if node.value == value
    #find_node(node.left, value) || find_node(node.right, value)
  #end

  def find_node(node, value)
    stack = [node]

    until stack.empty?
      p stack

      node = stack.pop
      return true if node.value == value
      stack << node.left  if node.left
      stack << node.right if node.right
    end

    false
  end

  let(:tree) do
    Node.new(5).tap do |n|
      n.left  = Node.new(3)
      n.right = Node.new(8)

      n.left.left  = Node.new(2)
      n.left.right = Node.new(1)
    end
  end

  it 'when existing value' do
    expect(find_node(tree, 2)).to be true
  end

  it 'when existing value' do
    expect(find_node(tree, 3)).to be true
  end

  it 'when not existing value' do
    expect(find_node(tree, 6)).to be false
  end
end
