class PigLatinize
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def piglatinize
    arr = text.split(" ")

    arr.collect do |word|
      if word.start_with?("a", "e", "i", "o", "u")
        word += "ay"
      else
        word_arr = word.split(/^([^aeiou]+)/).drop(1)
        front = word_arr.shift
        word_arr << front
        word_arr << "ay"
        word_arr.join
      end
      word.downcase.capitalize! 
    end.join(" ")
  end

  def capital_letter?(word)
    word =~ /[A-Z]/ ? true : false
  end

  def punctuation?(word)
    word.ends_with?(".", "," ":", ";", "!", "?") ? true : false
  end
end
