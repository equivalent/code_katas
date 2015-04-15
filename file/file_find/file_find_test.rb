require 'pathname'
require 'minitest/autorun'

describe File do
  let(:folder) { Pathname.new('./fixtures').expand_path }

  describe '#find' do
    it 'should be enum' do
      folder.find.must_be_kind_of Enumerator
    end

    describe 'when searching for txt extension' do
      it 'should return all txt files' do
        results = []

        folder
        .find do |path|
          if path.basename.to_s.match(/txt$/)
            results << path
          end
        end  #nil return value

        results.size.must_equal 4
      end
    end

    describe 'when searching for all files except one ' do 
      it 'should return remaining files' do
        results = []

        folder
        .find do |path|
          if (file_name = path.basename.to_s).match(/txt$/)
            next if  file_name.match(/foo/)
            results << path
          end
        end

        results.size.must_equal 3
      end
    end

    describe 'when I want to ignore directory and anything inside it' do
      it 'it sholud display only results outside that dir'  do
        results = []

        folder
        .find do |path|

          Find.prune if path.directory? && path.basename.to_s =~ /^xxx/

          if (file_name = path.basename.to_s).match(/txt$/)
            results << path
          end
        end 

        results.size.must_equal 2
      end
    end
  end
end
