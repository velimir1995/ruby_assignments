class Anagram

  def initialize(wordlist)
    @wordlist = wordlist
  end

  def to_s
    grouped_anagrams.map { |group| group.join(" ") }.join("\n")
  end

  def to_a
    grouped_anagrams
  end

  def find_by_word(word)
    grouped_anagrams.find { |group| group.include?(word) }
  end

  private

  def grouped_anagrams
    @grouped_anagrams ||= search_for_anagrams
  end

  def search_for_anagrams
    anagrams = []
    pairs = populate_pairs
    if pairs.length > 2
      anagrams = group_into_anagrams_groups(pairs)
    elsif pairs.length == 2
      anagrams = [pairs.transpose[0]] if pairs[0][1] == pairs[1][1]
    end
    anagrams.sort_by { |group| group[0] }
  end

  def populate_pairs
    pairs = if @wordlist.is_a?(Array) then populate_pairs_from_array
            elsif File.file?(@wordlist) then populate_pairs_from_file
            else populate_pairs_from_string
            end
    pairs.sort_by { |pair| pair[1] }
  end

  def populate_pairs_from_array
    paired_words = []
    @wordlist.each do |word|
      paired_words.push([word.strip, word.strip.downcase.chars.sort.join])
    end
    paired_words
  end

  def populate_pairs_from_string
    @wordlist = @wordlist.split(" ");
    populate_pairs_from_array
  end

  def populate_pairs_from_file
    paired_words = []
    file = File.open(@wordlist)
    File.readlines(file).each do |line|
      paired_words.push([line.strip, line.strip.downcase.chars.sort.join])
    end
    paired_words
  end

  def group_into_anagrams_groups(pairs)
    anagrams = []
    pairs.each_with_index do |pair, index|
      if pair[1] == pairs[index - 2][1]
        anagrams[anagrams.length - 1].push(pair[0])
      elsif pair[1] == pairs[index - 1][1]
        anagrams.push([pairs[index - 1][0], pair[0]])
      end
    end
    anagrams
  end

end
