# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + ":("
#   end
  
#   def self.yell_happily(words)
#     words + "<3!!!!!" + ":D"
#   end
# end

# p Shout.yell_angrily("I'M ANGRY")
# p Shout.yell_happily("YAY")

module Shout
  def yell_angrily(words)
    puts words + "!!!" + ":("
  end
  
  def yell_happily(words)
    puts words + "<3!!!!!" + ":D"
  end
end

class Mr_T
  include Shout
end

class Kahn
  include Shout
end

mr_t = Mr_T.new
mr_t.yell_happily("FOOL")

kahn = Kahn.new
kahn.yell_angrily("KAAAHHHHNNNN")