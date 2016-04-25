#downcase all letters
#make sure edge case is okay and use .tr and put the string back together

def agentcode(name)
   name.downcase!	
   name.tr!('bcdfghjklmnpqrstvwxyzb','cdfghjklmnpqrstvwxyzbc')
   name.tr!('aeiou','eioua')
   name.split(" ").reverse.map(&:capitalize).join(" ")
end

realname = nil
hash = {}
until realname == "" || realname == "quit"
  puts "What is the agent name. Type quit when finished or just press enter."
  realname = gets.chomp
  handle = agentcode(realname)
  hash.merge!(realname=>handle)
end
    
hash.each{|realname, handle| puts "#{realname} is really #{handle}"}