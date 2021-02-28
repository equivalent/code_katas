require 'spec_helper'

class Solution
  def solution
  end
end

RSpec.describe Solution do
  subject { described_class.new }

  def res
    subject.solution(a)
  end

  context '' do
    let(:a) { [] }
    it 'spec_name' do
    end
  end
end
