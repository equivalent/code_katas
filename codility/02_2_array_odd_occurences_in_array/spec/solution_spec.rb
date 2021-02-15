require 'spec_helper'


#   A[0] = 9  A[1] = 3  A[2] = 9
#   A[3] = 3  A[4] = 9  A[5] = 7
#   A[6] = 9
#
#   N is an odd integer within the range [1..1,000,000];
#   each element of array A is an integer within the range [1..1,000,000,000];
#   all but one of the values in A occur an even number of times.



module Solution
  extend self

  def solution(a)
    a.detect{ |e| a.count(e) <= 1 }
  end
end

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) { [9, 3, 9, 3, 9, 7, 9] }

    it { expect(res).to eq 7 }
  end
end
