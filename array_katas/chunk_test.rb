# based upon Ruby Tapas episod 290, 291

require 'minitest/autorun'

describe Array do

  let(:files) { [
      "AutoCAD",
      "Bliix",
      "Bring me the horizon",
      "Calisto",
      "Coal Chamber",
      "Codeclimate",
      "Disturbed",
      "Deathcore"
    ]
  }

  let(:files_with_x) { [
      "AutoCAD",
      "Bliix",
      "Bring me the horizon",
      "Calisto",
      "Coal Chamber",
      "X-Stuff",
      "Codeclimate",
      "Disturbed",
      "Deathcore"
    ]
  }



  describe "using map" do
    it do
      files.map {|f| f[0]}.must_be_kind_of Array
    end

    it do
      files.map {|f| f[0]}.must_equal ["A", "B", "B", "C", "C", "C", "D", "D"]
    end
  end

  describe 'using group_by' do
    it do
      files.group_by {|f| f[0]}.must_be_kind_of Hash
    end

    it do
      files
        .group_by {|f| f[0]}
        .must_equal({
          "A"=>["AutoCAD"],
          "B"=>["Bliix", "Bring me the horizon"],
          "C"=>["Calisto", "Coal Chamber", "Codeclimate"],
          "D"=>["Disturbed", "Deathcore"]
        })
    end

    it do
      files_with_x
        .group_by {|f| f[0]}
        .must_equal({
          "A"=>["AutoCAD"],
          "B"=>["Bliix", "Bring me the horizon"],
          "C"=>["Calisto", "Coal Chamber", "Codeclimate"],
          "X"=>["X-Stuff"],
          "D"=>["Disturbed", "Deathcore"]
        })
    end
  end

  describe 'using chunk' do
    let(:code) {
      # code below could be easily written just as:
      #
      #   code = File.read('fixtures/dummy_code.rb')
      #
      # ...but repo is sporting multiple levels of folders wher tests could run
      File.read(File.expand_path(File.dirname(__FILE__)) + '/fixtures/dummy_code.rb')
    }

    it do
      files.chunk {|f| f[0]}.must_be_kind_of Enumerator
    end

    it do
      files
        .chunk {|f| f[0]}
        .to_a
        .must_equal [
          ["A", ["AutoCAD"]],
          ["B", ["Bliix", "Bring me the horizon"]],
          ["C", ["Calisto", "Coal Chamber", "Codeclimate"]],
          ["D", ["Disturbed", "Deathcore"]]
        ]
    end

    it do
      files_with_x
        .chunk {|f| f[0]}
        .to_a
        .must_equal [
          ["A", ["AutoCAD"]],
          ["B", ["Bliix", "Bring me the horizon"]],
          ["C", ["Calisto", "Coal Chamber"]],
          ["X", ["X-Stuff"]],
          ["C", ["Codeclimate"]],
          ["D", ["Disturbed", "Deathcore"]]
        ]
    end

    it 'code example chars should categorized' do
      code
        .chars
        .chunk{|c|
          case c
          when /\n/ then :endline
          when /\s/ then :whitespace
          when /[[:alpha:]]/ then :identifier
          when /\d/ then :number
          end
        }
        .to_a
        .must_equal [
          [:identifier, ["t", "o", "t", "a", "l"]],
          [:whitespace, [" "]],
          [:whitespace, [" "]],
          [:number, ["1", "2", "3"]],
          [:whitespace, [" "]],
          [:whitespace, [" "]],
          [:number, ["4", "5", "6"]],
          [:endline, ["\n"]],
          [:identifier, ["p", "r", "i", "n", "t"]],
          [:whitespace, [" "]],
          [:identifier, ["t", "o", "t", "a", "l"]],
          [:endline, ["\n", "\n"]]
        ]
    end

    it 'code example using chunk operators should ignore whitespaces' do
      code
        .chars
        .chunk{|c|
          case c
          when /\n/ then :endline
          when /\s/ then :_separator # special chunk operator, it acts as nil, it's just more readable
          when /[[:alpha:]]/ then :identifier
          when /\d/ then :number
          end
        }
        .to_a
        .must_equal [
          [:identifier, ["t", "o", "t", "a", "l"]],
          [:number, ["1", "2", "3"]],
          [:number, ["4", "5", "6"]],
          [:endline, ["\n"]],
          [:identifier, ["p", "r", "i", "n", "t"]],
          [:identifier, ["t", "o", "t", "a", "l"]],
          [:endline, ["\n", "\n"]]
        ]
    end

    it 'code example using chunk operators should ignore whitespaces' do
      # code below could be easily written just as:
      #
      #   code = File.read('fixtures/dummy_code_2.rb')
      #
      # ...but repo is sporting multiple levels of folders wher tests could run
      code = File.read(File.expand_path(File.dirname(__FILE__)) + '/fixtures/dummy_code_2.rb')

      code
        .chars
        .chunk{|c|
          case c
          when /\n/ then :endline
          when /[[:alpha:]]/ then :identifier
          when /[\!\+\-\=\/\*]/ then :_alone # special chunk operator
          when /\d/ then :number
          end
        }
        .to_a
        .must_equal [
          [:identifier, ["b", "o", "o", "l"]],
          [:_alone, ["="]],
          [:_alone, ["!"]],
          [:_alone, ["!"]],
          [:identifier, ["r", "e", "s", "u", "l", "t"]],
          [:endline, ["\n"]]
        ]
      end
  end
end
