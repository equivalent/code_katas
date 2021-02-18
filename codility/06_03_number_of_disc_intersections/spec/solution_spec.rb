require 'spec_helper'
require 'benchmark'
require 'irb'
module Solution
  extend self

  def solution(a)

    ranges = { }

    a.each_with_index do |val, index|

      left  =  index - val
      right =  index + val


      if ranges.any?
        range = nil
        ranges.each do |r, __|
          range = r if r.include?(left) || r.include?(right)
        end

        if range
            l = range.min
            l = left if left < l

            r = range.max
            r = right if right > r

            new_range = (l..r)
            #binding.irb
            #ranges[new_range] = ranges.delete(range)


            ranges[range] << left
            ranges[range] << right unless left == right

            import_vals = []
            ranges.each do |ran, __|

              if new_range.include?(ran.min ) || new_range.include?(ran.max )
                import_vals = import_vals + ranges.delete(ran)
              end

              #binding.irb
              #if ran.include?(l) || ran.include?(r)
                #import_vals = import_vals + ranges.delete(ran)
              #end
            end
            ranges[new_range] = import_vals



        else
          new(ranges, left, right)
        end
      else
        new(ranges, left, right)
      end
    end

    intesection_count = 0

    p ranges

    ranges.each do |_, values|
      intesection_count += values.size if values.size > 1
    end
    intesection_count
  end

  def new(ranges, left, right)
        range = left..right
        ranges[range] ||= []
        ranges[range] << left
        ranges[range] << right unless left == right
        nil
  end
end



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
    let(:a) { [1,5,2,1,4,0] }

    #A[0] = 1
    #A[1] = 5
    #A[2] = 2
    #A[3] = 1
    #A[4] = 4
    #A[5] = 0
    #
    # 0  [-1, +1
    # 1  [-4, 6]
    # 2  [0, 4]
    # 3  [2, 4]
    # 4  [0, 8]
    # 5  [5,5]
    #
    #

    it { expect(res).to eq(11) }
  end


  context do
    let(:a) { [3,2] }

    it { expect(res).to eq(4) }
  end


  context do
    let(:a) { [3,2, 0] }
    it { expect(res).to eq(5) }
  end

  context do
    let(:a) { [3,2, 0, 0] }

    it { expect(res).to eq(6) }
  end

  context do
    let(:a) { [3,2, 0, 0, 0] }

    it { expect(res).to eq(6) }
  end


  context 'intersections appart' do
    let(:a) { [3,2, 0, 0, 0, 0] }

    it { expect(res).to eq(6) }
  end

  context 'intersections appart' do
    let(:a) { [3,2, 0, 0, 0, 0, 1] }

    it { expect(res).to eq(9) }
  end

  context 'intersections appart' do
    let(:a) { [3,2, 0, 0, 0, 0, 2] }

    it { expect(res).to eq(10) }
  end

  context 'intersections appart' do
    let(:a) { [3,2, 0, 0, 0, 0, 3] }

    it { expect(res).to eq(10) }
  end
end
