require 'spec_helper'
require 'benchmark'
module Solution
  extend self

  def solution(a)
    max_product = nil
    a.combination(3).each do |triplet|
      #p triplet
      product = triplet.inject(:*)
      #p product
      #puts "\n"
      max_product = product if max_product.nil?
      max_product = product if  product > max_product
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

  def res
    r = nil
    measurement = Benchmark.measure do
      r = described_class.solution(a)
    end
    puts "BENCH Real: #{measurement.real}"
    puts "BENCH utime: #{measurement.utime}"
    puts "BENCH stime: #{measurement.stime}"
    puts "\n"*4
    r
  end

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
    let(:a) { (-200...200).to_a }

    it do
      expect(res).to eq(7920200)
    end
  end


  context do
    let(:a) { (-200...-10).to_a }

    it do
      expect(res).to eq(-1716)
    end
  end
end
