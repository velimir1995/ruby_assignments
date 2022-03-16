require "anagrams"
describe Anagram do

  let(:anagrams_in_pdf) do
    Anagram.new(File.dirname(__FILE__) + "/support/dictionaries/small_dictionary.pdf")
  end
  let(:no_anagrams_in_txt) do
    Anagram.new(File.dirname(__FILE__) + "/support/dictionaries/small_dictionary_no_anagrams.txt")
  end
  let(:anagrams_in_two_words_array) { Anagram.new(["spot", "post"]) }
  let(:no_anagrams_in_two_words_string) { Anagram.new("pasta water") }
  let(:no_anagrams_in_single_word_array) { Anagram.new(["non_anagram"]) }

  describe "#find_by_word" do

    context "when match" do
      it "returns a group of words that are anagrams" do
        message = "enlist"
        expected = ["enlist", "inlets", "listen", "silent"]
        expect(anagrams_in_pdf.find_by_word(message)).to eq(expected)
      end
    end

    context "when don`t match" do
      it "returns nil" do
        message = "bbbbb"
        expect(anagrams_in_pdf.find_by_word(message)).to eq(nil)
      end
    end

    context "when search where is no anagrams" do
      it "returns nil" do
        message = "club"
        expect(no_anagrams_in_txt.find_by_word(message)).to eq(nil)
      end
    end

  end

  describe "#to_s" do

    it "returns a String" do
      expect(anagrams_in_pdf.to_s).to be_a(String)
    end

    context "When there is no anagrams " do
      it "returns an empty String" do
        expect(no_anagrams_in_txt.to_s).to eq("")
      end
    end

    context "When there are anagrams " do
      it "returns anagrams grouped in lines" do
        expected = "atest State\nboaster boaters borates\ndog God\nenlist inlets listen silent\n"\
                  "fresher refresh\nrots sort\nwoodworm's wormwood's woodworms wormwoods"
        expect(anagrams_in_pdf.to_s).to eq(expected)
      end
    end

  end

  describe "#to_a" do

    it "returns an Array" do
      expect(anagrams_in_pdf.to_a).to be_a(Array)
    end

    context "When there is no anagrams in file  " do
      it "returns an empty Array" do
        expect(no_anagrams_in_txt.to_a).to eq([])
      end
    end

    context "When there are words with special characters " do
      it "ignores non-letter characters in words and is case-insensitive" do
        expected = [["atest", "State"], ["boaster", "boaters", "borates"],
                  ["dog", "God"], ["enlist", "inlets", "listen", "silent"],
                  ["fresher", "refresh"], ["rots", "sort"], ["woodworm's", "wormwood's", "woodworms", "wormwoods"]]
        expect(anagrams_in_pdf.to_a).to eq(expected)
      end
    end

    context "When two anagrams words" do
      it "returns that pair" do
        expected = [["spot", "post"]]
        expect(anagrams_in_two_words_array.to_a).to eq(expected)
      end
    end

    context "When two non-anagrams words" do
      it "returns an empty array" do
        expect(no_anagrams_in_two_words_string.to_a).to eq([])
      end
    end

    context "When single word " do
      it "returns an empty array" do
        expect(no_anagrams_in_single_word_array.to_a).to eq([])
      end
    end

  end

end
