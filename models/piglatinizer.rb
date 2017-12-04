class PigLatinize
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def piglatinize
    arr = text.split(" ")

    arr.collect do |word|
      punctuation?(word) ? punct = word.slice!(/\W/) : punct = nil

      if word !~ /^[AEIOUaeiou]/
        word_arr = word.split(/^([^aeiou]+)/).drop(1)
        word_arr << word_arr.shift
        word = word_arr.join
      end

        word += "ay"
        capital_letter?(word) ? word.downcase.capitalize! : word
        # word += punct if punct != nil
        # word

    end.join(" ")
  end

  def capital_letter?(word)
    word =~ /[A-Z]/ ? true : false
  end

  def punctuation?(word)
    word.end_with?(".", "," ":", ";", "!", "?") ? true : false
  end
end
