class Puppy
  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
    number.times {|i| puts "Woof!"}
  end
  
  def roll_over
    puts "rolls over"
  end
  
  def dog_years(age)
    dog_age=age*7
    puts "#{dog_age} dog years"
  end
  
  def lick_face
    puts "The puppy licks your face!"
  end
end

my_puppy = Puppy.new
p my_puppy.fetch("bone")
my_puppy.speak(5)
my_puppy.roll_over
my_puppy.dog_years(5)
my_puppy.lick_face

class Ripoff_Siri
  def initialize
    puts "Initializing new ripoff siri"
  end
  
  def greeting(name)
    puts "Hey #{name}, how are you today?"
  end
  
  def joke()
    puts "Why did the chicken cross the road?" 
    puts "Because he was afraid of his own shadow..."
    puts "Sorry, what do you expect from a program?"
  end
end

list_of_siris = []

until list_of_siris.length == 50
 list_of_siris << Ripoff_Siri.new
end

list_of_siris.each do |siri|
  siri.greeting("Junkanoo")
  siri.joke()
end