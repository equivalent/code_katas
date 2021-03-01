require 'spec_helper'

class Solution
  def solution(a)
  end
end

RSpec.describe Solution do
  subject { described_class.new }

  def res
    subject.solution(a)
  end

  context  do
    let(:a) { [] }
    it do
    end
  end
end
