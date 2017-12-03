class PigLatinize
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def piglatinize
    arr = text.split(" ")

    arr.collect do |word|
      if word.split("").first == /[aeiou]/
        word += "ay"
      else
        word_arr = word.split(/[aeiou]/)
        front = word_arr.shift
        word_arr << front
        word_arr << "ay"
      end
      end.join
  end
end