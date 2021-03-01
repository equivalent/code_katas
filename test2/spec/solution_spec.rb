require 'spec_helper'

# given str representing phone number
# * ignore spaces dashes
# * reformat phonen umboer in block of 3 numbers separated by dash
# * if necessary last two blocks can be of length of two
#
# use Ruby 2.2

class Solution
  def solution(a)
    a = a.gsub(/\D/, '').split(//)
    new = []
    until a.size < 1
      if a.size == 4 || a.size == 2
        new << a.shift(2).join()
      else
        new << a.shift(3).join()
      end
    end
    new.join('-')
  end
end

RSpec.describe Solution do
  subject { described_class.new }

  def res
    subject.solution(a)
  end

  context '' do
    let(:a) { '00-44    48 5555 8361' }
    it  do
      expect(res).to eq('004-448-555-583-61')
    end
  end

  context '' do
    let(:a) { '0 - 22 1985--324' }
    it  do
      expect(res).to eq('022-198-53-24')
    end
  end

  context '' do
    let(:a) { '555372654' }
    it  do
      expect(res).to eq('555-372-654')
    end
  end

  # my examples
  context '' do
    let(:a) { '12' }
    it  do
      expect(res).to eq('12')
    end
  end

  context '' do
    let(:a) { '123' }
    it  do
      expect(res).to eq('123')
    end
  end

  context '' do
    let(:a) { '1234' }
    it  do
      expect(res).to eq('12-34')
    end
  end

  context '' do
    let(:a) { '12345' }
    it  do
      expect(res).to eq('123-45')
    end
  end

  context '' do
    let(:a) { '123456' }
    it  do
      expect(res).to eq('123-456')
    end
  end



  context '' do
    let(:a) { '1234567891234567891234567891234567891234567899' }
    it  do
      expect(res).to eq('123-456-789-123-456-789-123-456-789-123-456-789-123-456-78-99')
    end
  end
end
