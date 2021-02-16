require 'spec_helper'
require 'irb'
module Solution
  extend self

  def solution(a)
  end
end

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) {  }

    it { expect(res).to eq :todo }
  end
end
