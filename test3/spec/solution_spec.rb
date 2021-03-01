require 'spec_helper'

# dialer on phone and start typiong a anumber you will get search results from saved contacs for number you entered
#
# * saved contacts from 0 to N-1
# * represented by arrays AB
#
# * if no match "NO CONTACT"
# * N is 1..100
# * continuous substring
# * number cosist of digits only
#
class Solution
  def solution(names, numbers, p)
    found_indexes = []

    numbers.each_with_index do |number, index|
      found_indexes << index if number.match(p)
    end

    return 'NO CONTACT' unless found_indexes.any?

    found_names = []
    found_indexes.each do |index|
      found_names << names[index]
    end

    found_names.sort.first
  end
end

RSpec.describe Solution do
  subject { described_class.new }

  def res
    subject.solution(a, b, p)
  end

  context  do
    let(:a) { ['pim', 'pom'] }
    let(:b) { ['999999999', '777888999'] }
    let(:p) { '88999' }

    it do
      expect(res).to eq('pom')
    end
  end

  context  do
    let(:a) { ['sander', 'amy', 'ann', 'michaeel'] }
    let(:b) { ['123456789', '234567890', '789123456', '123123123'] }
    let(:p) { '1' }

    it do
      #sander ann michael phone number contains '1' but ann is alphabetically smaller
      expect(res).to eq('ann')
    end
  end

  context  do
    let(:a) { ['adam', 'eva', 'leo'] }
    let(:b) { ['121212121', '111111111', '4444555666'] }
    let(:p) { '112' }

    it do
      expect(res).to eq('NO CONTACT')
    end
  end

  # my examples
  context  do
    let(:a) { [] }
    let(:b) { [] }
    let(:p) { '' }

    it do
      expect(res).to eq('NO CONTACT')
    end
  end

  context  do
    let(:a) { ['aaa', 'aab'] }
    let(:b) { ['111111111', '111111111'] }
    let(:p) { '11' }

    it do
      expect(res).to eq('aaa')
    end
  end


end
