require 'pathname'

class Anagrams

  def initialize(text_file)
    @text_file = text_file
  end

  def to_s
    find_anagrams.map { |group| group.join(" ") }.join("\n")
  end

  def to_a
    find_anagrams
  end

  def find_by_word(word)
    find_anagrams.find { |group| group.include?(word) }
  end

  private

  def find_anagrams
    (@grouped_anagrams || search_for_anagrams).sort_by { |group| group[0] }
  end

  def search_for_anagrams
    @grouped_anagrams = []
    pairs = fill_and_sort_words_with_char_order_pair
    if pairs.length > 2
      group_into_anagrams_groups(pairs)
    elsif pairs.length == 2
      @grouped_anagrams = [pairs.transpose[0]] if pairs[0][1] == pairs[1][1]
    end
    @grouped_anagrams
  end

  def fill_and_sort_words_with_char_order_pair
    paired_words = []
    file = File.open(Pathname.getwd.to_s + "/documents/#{@text_file}.txt")
    File.readlines(file).each do |line|
      paired_words.push([line.strip, line.strip.downcase.chars.sort.join])
    end
    paired_words.sort_by { |pair| pair[1] }
  end

  def group_into_anagrams_groups(pairs)
    pairs.each_with_index do |pair, index|
      if pair[1] == pairs[index - 2][1]
        @grouped_anagrams[@grouped_anagrams.length - 1].push(pair[0])
      elsif pair[1] == pairs[index - 1][1]
        @grouped_anagrams.push([pairs[index - 1][0], pair[0]])
      end
    end
  end

end
