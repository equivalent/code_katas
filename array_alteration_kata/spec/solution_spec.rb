require 'spec_helper'

RSpec.describe Solution do
  let(:result) { described_class.solution(a, b)  }

  context 'basic example' do
    let(:a) { [1,3] }
    let(:b) { [2] }
    it do
      expect(result).to eq([1,2,3])
    end
  end

  xcontext 'full example' do
    let(:a) { [1,3,5] }
    let(:b) { [2, 4, 8] }
    it do
      expect(result).to eq([1,2,3,4,5,8])
    end
  end
end
