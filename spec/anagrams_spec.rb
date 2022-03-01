require "anagrams"
describe Anagram do

  let(:two_words_anagrams) do
    Anagram.new(Pathname.getwd.to_s + "/spec/support/dictionaries/two_words_anagrams.txt")
  end
  let(:two_words_non_anagrams) do
    Anagram.new(Pathname.getwd.to_s + "/spec/support//dictionaries/two_words_non_anagrams.txt")
  end
  let(:small_pdf_dictionary_anagrams) do
    Anagram.new(Pathname.getwd.to_s + "/spec/support/dictionaries/small_dictionary.pdf")
  end
  let(:small_dictionary_without_anagrams) do
    Anagram.new(Pathname.getwd.to_s + "/spec/support/dictionaries/small_dictionary_no_anagrams.txt")
  end
  let(:single_line_file) do
    Anagram.new(Pathname.getwd.to_s + "/spec/support/dictionaries/single_line.txt")
  end
  let(:string_dictonary) { Anagram.new("bup club dub pap pub put tup") }
  let(:array_dictonary) { Anagram.new(["bup", "club","dub", "pap", "pub", "put", "tup"]) }

  describe "#find_by_word" do

    context "when match" do
      it "returns group with anagrams in array" do
        message = "pub"
        expected = ["bup", "pub"]
        message1 = "enlist"
        expected1 = ["enlist", "inlets", "listen", "silent"]
        expect(string_dictonary.find_by_word(message)).to eq(expected)
        expect(small_pdf_dictionary_anagrams.find_by_word(message1)).to eq(expected1)
      end
    end

    context "when don`t match" do
      it "returns nil" do
        message = "bbbbb"
        message1 = "enlist"
        expect(string_dictonary.find_by_word(message)).to eq(nil)
        expect(small_pdf_dictionary_anagrams.find_by_word(message)).to eq(nil)
        expect(small_dictionary_without_anagrams.find_by_word(message1)).to eq(nil)
      end
    end

  end

  describe "#to_s" do
    context do
      it "returns a String" do
        expect(two_words_anagrams.to_s).to be_a(String)
        expect(two_words_non_anagrams.to_s).to be_a(String)
        expect(small_pdf_dictionary_anagrams.to_s).to be_a(String)
        expect(small_dictionary_without_anagrams.to_s).to be_a(String)
        expect(single_line_file.to_s).to be_a(String)
        expect(string_dictonary.to_s).to be_a(String)
        expect(array_dictonary.to_s).to be_a(String)
      end
    end

    context "When there is no anagrams " do
      it "returns an empty String" do
        expected = ""
        expect(two_words_non_anagrams.to_s).to eq(expected)
        expect(single_line_file.to_s).to eq(expected)
        expect(small_dictionary_without_anagrams.to_s).to eq(expected)
      end
    end

    context "When contain two words that are anagrams " do
      it "returns one anagram pair" do
        expected = "enlist silent"
        expect(two_words_anagrams.to_s).to eq(expected)
      end
    end

    context "With wordlist with anagrams " do
      it "returns an anagrams grouped in lines" do
        expected = "atest State\nboaster boaters borates\ndog God\nenlist inlets listen silent\n"\
                  "fresher refresh\nrots sort"
        expected1 = "bup pub\nput tup"
        expect(small_pdf_dictionary_anagrams.to_s).to eq(expected)
        expect(array_dictonary.to_s). to eq(expected1)
      end
    end

  end

  describe "#to_a" do

    context do
      it "returns an Array" do
        expect(two_words_anagrams.to_a).to be_a(Array)
        expect(two_words_non_anagrams.to_a).to be_a(Array)
        expect(small_pdf_dictionary_anagrams.to_a).to be_a(Array)
        expect(small_dictionary_without_anagrams.to_a).to be_a(Array)
        expect(single_line_file.to_a).to be_a(Array)
        expect(string_dictonary.to_a).to be_a(Array)
        expect(array_dictonary.to_a).to be_a(Array)
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

    context "With wordlist with anagrams " do
      it "returns anagrams grouped in subarrays" do
        expected = [["atest", "State"], ["boaster", "boaters", "borates"],
                  ["dog", "God"], ["enlist", "inlets", "listen", "silent"],
                  ["fresher", "refresh"], ["rots", "sort"]]
        expected1 = [["bup", "pub"], ["put", "tup"]]
        expect(small_pdf_dictionary_anagrams.to_a).to eq(expected)
        expect(string_dictonary.to_a).to eq(expected1)
      end
    end

  end

end
