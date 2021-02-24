require 'rspec'

class Graph
  def initialize(tree)
    @tree = tree
  end

  def neighbours(v)
    @tree[v]
  end
end

class Solution
  attr_reader :visits

  def initialize
    @marked = {}
    @visits = []
  end

  def dfs(graph, v)
    visit(v)
    @marked[v] = true
    graph.neighbours(v).each do |w|
      dfs(graph, w) unless @marked[w]
    end
  end

  def visit(v)
    @visits << v
  end
end

class SulutionUsingStack
  attr_reader :visits

  def initialize
    @marked = {}
    @visits = []
  end

  def dfs(graph, v)
    stack = [v]
    while stack.size > 0
      v = stack.pop
      unless @marked[v]
        visit(v)
        @marked[v] = true
        graph.neighbours(v).each do |w|
          stack << w unless @marked[w]
        end
      end
    end
  end

  def visit(v)
    @visits << v
  end
end

class SolutionPostOrder
  attr_reader :visits

  def initialize
    @marked = {}
    @visits = []
  end

  def dfs_post(graph, v)
    @marked[v] = true
    graph.neighbours(v).each do |w|
      dfs_post(graph, w) unless @marked[w]
    end
    visit(v)
  end

  def topoligical_sort_visits
    # DFS post order in reverse is a valid topological sort
    visits.reverse
  end

  def visit(v)
    @visits << v
  end
end



RSpec.describe 'solutions by Reducible youtube chanell' do
  # correct most performent solution from Reducible https://www.youtube.com/watch?v=PMMc4VsIacU&t=604s
  #
  #
  #     1  -- 4     8 - 9
  #   /    \      / |
  # 0   |   3 ---5  |
  #   \     |     \ |
  #     2   6      7
  #
  #
  let(:graph_tree) do
    {
      0 => [1, 2],
      1 => [0, 2, 4, 3],
      2 => [0, 1],
      3 => [1, 4, 5, 6],
      4 => [1],
      5 => [3, 8, 7],
      6 => [3],
      7 => [5, 8],
      8 => [5, 7, 9],
      9 => [8]
    }
  end

  let(:graph) do
    Graph.new(graph_tree)
  end


  it 'solution' do
    solution = Solution.new
    solution.dfs(graph, 0)
    expect(solution.visits).to eq [0, 1, 2, 4, 3, 5, 8, 7, 9, 6]
  end

  it 'solution using stack' do
    solution = SulutionUsingStack.new
    solution.dfs(graph, 0)
    expect(solution.visits).to eq [0, 2, 1, 3, 6, 5, 7, 8, 9, 4]
  end

  it 'solution' do
    solution = SolutionPostOrder.new
    solution.dfs_post(graph, 0)
    expect(solution.visits).to eq [2, 4, 7, 9, 8, 5, 6, 3, 1, 0]

    expect(solution.topoligical_sort_visits).to eq [0, 1, 3, 6, 5, 8, 9, 7, 4, 2]
  end
end

