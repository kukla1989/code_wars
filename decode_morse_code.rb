#https://www.codewars.com/kata/54b724efac3d5402db00065e/train/ruby
@morse_dict = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--..",
  "1" => ".----",
  "2" => "..---",
  "3" => "...--",
  "4" => "....-",
  "5" => ".....",
  "6" => "-....",
  "7" => "--...",
  "8" => "---..",
  "9" => "----.",
  "0" => "-----",
  "SOS" => "···−−−···"
}

def decode_morse(morse_code)
  morse_words = morse_code.split("   ").map(&:strip)
  res = ""
  morse_words.each do |morse_word|
    morse_word.split(" ").each do |morse_letter|
      res += @morse_dict.key(morse_letter)
    end
    res += " "
  end
  res.strip.upcase
end

p decode_morse '.... . -.--   .--- ..- -.. .'
p 'HEY JUDE'