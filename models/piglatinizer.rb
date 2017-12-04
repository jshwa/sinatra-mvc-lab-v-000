require 'pry'

class PigLatinizer

  def piglatinize(text)
    arr = text.split(" ")

    arr.collect do |word|
      punctuation?(word) ? punct = word.slice!(/\W/) : punct = nil

      if word =~ /^[AEIOUaeiou]/
        word += "way"
      else
        word_arr = word.split(/^([^aeiou]+)/).drop(1)
        word_arr << word_arr.shift
        word = word_arr.join
        word += "ay"
      end

        word += punct if punct != nil
        capital_letter?(word) ? word.capitalize! : word

    end
    binding.pry
  end

  def capital_letter?(word)
    word =~ /[A-Z]/ ? true : false
  end

  def punctuation?(word)
    word.end_with?(".", "," ":", ";", "!", "?") ? true : false
  end
end
