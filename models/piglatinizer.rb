class PigLatinize
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def piglatinize
    arr = text.split(" ")

    arr.collect do |word|
      if word.start_with?(/[aeiou]/)
        word += "ay"
      else
        word_arr = word.split(/^([^aeiou]+)/).drop(1)
        front = word_arr.shift
        word_arr << front
        word_arr << "ay"
        word_arr.join
      end
      end.join
  end
end
