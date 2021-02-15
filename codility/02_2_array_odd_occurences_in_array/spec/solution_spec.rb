require 'spec_helper'


module Solution
  extend self

  def solution(a)
    occurences = { }
    a.each do |item|
      if occurences[item]
        occurences[item] = false
      else
        occurences[item] = true
      end
    end

    occurences.select { |k, v| v }.keys.first
  end
end

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) { [9, 3, 9, 3, 9, 7, 9] }

    it { expect(res).to eq 7 }
  end

  context do
    let(:a) { [1] }
    it { expect(res).to eq 1 }
  end

  context do
    let(:a) { [1,1] }
    it { expect(res).to eq nil }
  end

  context do
    let(:a) { [2,1,2,1,2] }
    it { expect(res).to eq 2 }
  end

  context 'heavy performance' do
    let(:a) do
      x  = []
      1000.times do |n|
        item = n * 999_999
        x << item
        x << item
      end
      x << 777_777_777
      x
    end
    it { expect(res).to eq 777_777_777 }
  end
end
