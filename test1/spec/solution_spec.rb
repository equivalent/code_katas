require 'date'
require 'spec_helper'

# John taking a vacation on Hawaii
#
# * plane departs every Monday and arrives every Sunday
# * John can spend only whole week
# * vacation starts on the first day of the beginning month
# * last day of ending month
# * he knows year
# * 
# * Y  2014
# * A April
# * B May
# * W Wednesday
# 

class Solution
  def solution(year, begin_month, end_month, day)
    bm = Date.parse("#{year} #{begin_month} 01") # begining_month

    em = Date.parse("#{year} #{end_month}")
    em = Date.new(em.year, em.month, -1) # end month

    theday_method = "#{day.downcase}?"

    theday = bm
    until theday.public_send(theday_method)
      theday = theday.next
    end

    puts theday

    departure_date = theday
    until departure_date.monday?
      departure_date = departure_date.next
    end

    puts departure_date

    back_date = em
    until back_date.sunday?
      back_date = back_date.prev_day
    end

    puts back_date

    back_date.cweek - departure_date.cweek + 1
  end
end

RSpec.describe Solution do
  subject { described_class.new }

  let(:result) { subject.solution(y, a, b, w) }

  context '' do
    let(:y) { 2014 }
    let(:a) { 'April' }
    let(:b) { 'May' }
    let(:w) { 'Wednesday' }

    it 'spec_name' do
      expect(result).to eq 7
    end
  end
end
