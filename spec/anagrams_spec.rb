require "anagrams"
describe Anagrams do

  let(:two_words_anagrams) { Anagrams.new("two_words_anagrams") }
  let(:two_words_non_anagrams) { Anagrams.new("two_words_non_anagrams") }
  let(:small_dictionary_anagrams) { Anagrams.new("small_dictionary") }
  let(:small_dictionary_without_anagrams) { Anagrams.new("small_dictionary_without_anagrams") }
  let(:single_line_file) { Anagrams.new("single_line") }

  describe "#to_s" do

    context do
      it "always returns a String" do
        expect(two_words_anagrams.to_s).to be_a(String)
        expect(two_words_non_anagrams.to_s).to be_a(String)
        expect(small_dictionary_anagrams.to_s).to be_a(String)
        expect(small_dictionary_without_anagrams.to_s).to be_a(String)
        expect(single_line_file.to_s).to be_a(String)
      end
    end

    context "When there is no anagrams in file " do
      it "returns an empty String" do
        expected = ""
        expect(two_words_non_anagrams.to_s).to eq(expected)
        expect(single_line_file.to_s).to eq(expected)
        expect(small_dictionary_without_anagrams.to_s).to eq(expected)
      end
    end

    context "When file contain two words that are anagrams " do
      it "returns one anagram pair" do
        expected = "enlist silent"
        expect(two_words_anagrams.to_s).to eq(expected)
      end
    end

    context "With small anagrams dictionary " do
      it "returns an anagrams grouped in lines" do
        expected = "atest State\nboaster boaters borates\ndog God\nenlist inlets listen silent\n"\
                  "fresher refresh\nrots sort"
        expect(small_dictionary_anagrams.to_s).to eq(expected)
      end
    end

  end

  describe "#to_a" do

    context do
      it "always returns an Array" do
        expect(two_words_anagrams.to_a).to be_a(Array)
        expect(two_words_non_anagrams.to_a).to be_a(Array)
        expect(small_dictionary_anagrams.to_a).to be_a(Array)
        expect(small_dictionary_without_anagrams.to_a).to be_a(Array)
        expect(single_line_file.to_a).to be_a(Array)
      end
    end

    context "When there is no anagrams in file  " do
      it "returns an empty Array" do
        expected = []
        expect(two_words_non_anagrams.to_a).to eq(expected)
        expect(single_line_file.to_a).to eq(expected)
        expect(small_dictionary_without_anagrams.to_a).to eq(expected)
      end
    end

    context "When file contain two words that are anagrams " do
      it "returns one anagram pair" do
        expected = [["enlist", "silent"]]
        expect(two_words_anagrams.to_a).to eq(expected)
      end
    end

    context "With small anagrams dictionary " do
      it "returns anagrams grouped in subarrays" do
        expected = [["atest", "State"], ["boaster", "boaters", "borates"],
                  ["dog", "God"], ["enlist", "inlets", "listen", "silent"],
                  ["fresher", "refresh"], ["rots", "sort"]]
        expect(small_dictionary_anagrams.to_a).to eq(expected)
      end
    end

  end

end
