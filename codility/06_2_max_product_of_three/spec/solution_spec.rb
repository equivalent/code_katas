require 'spec_helper'
module Solution
  extend self

  def solution(a)
    max_product = 0
    a.combination(3).each do |triplet|
      #p triplet
      product = triplet.inject(:*)
      #p product
      #puts "\n"
      max_product = product if product > max_product
    end
    max_product
  end
end

# A non empty arary contains N elements
#
# product of triplens A[P] * A[Q] * A[R]
# 0<= P < Q < R< N
# 
# N 3 .. 100_000
# elements in A are in range [-1_000 .. 1_000]


RSpec.describe Solution do

  let(:res) { described_class.solution(a)  }

  context do
    let(:a) { [-3,1,2,-2,5,6] }

    it { expect(res).to eq(60) }
  end


  # my examples


  context do
    let(:a) { [-5, 1, 3, 2] }

    it { expect(res).to eq(6) }
  end


  context do
    let(:a) { (-10...10).to_a }

    it { expect(res).to eq(810) }
  end


end