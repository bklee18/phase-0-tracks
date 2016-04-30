module Shout
  def self.yell_angrily(words)
    words + "!!!" + ":("
  end
  
  def self.yell_happily(words)
    words + "<3!!!!!" + ":D"
  end
end

p Shout.yell_angrily("I'M ANGRY")
p Shout.yell_happily("YAY")