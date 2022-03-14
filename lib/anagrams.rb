class Anagram

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def to_s
    to_a.map { |group| group.join(" ") }.join("\n")
  end

  def to_a
    grouped_anagrams.values
  end

  def find_by_word(word)
    grouped_anagrams[sort_letters(word)]
  end

  private

  def grouped_anagrams
    @grouped_anagrams ||= search_for_anagrams
  end

  def search_for_anagrams
    anagrams = {}
    set_words_to_array(@dictionary).each do |word|
      sorted_chars = sort_letters(word)
      anagrams[sorted_chars] ? anagrams[sorted_chars] << word : anagrams[sorted_chars] = [word]
    end
    anagrams.delete_if { |key, value| value.length < 2}
  end

  def set_words_to_array(dictionary)
    if dictionary.is_a?(Array)
      dictionary
    elsif File.file?(dictionary)
      populate_words_from_file(dictionary)
    elsif dictionary.is_a?(String)
      dictionary.split(" ");
    end
  end

  def populate_words_from_file(dictionary)
    wordslist = []
    file = File.open(dictionary)
    File.readlines(file).each do |line|
      wordslist << line.strip
    end
    wordslist
  end

  def sort_letters(word)
    word.gsub(/[^a-zA-Z]/, '').downcase.chars.sort.join
  end
end
