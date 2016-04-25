class Santa
  attr_reader :ethnicity
  attr_accessor :gender, :age
  
  def initialize(gender, ethnicity)
    puts "Initializing new Santa..."
    @gender=gender
    @ethnicity=ethnicity
    @reindeer_ranking=["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age=0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end
  
  def eat_milk_and_cookies cookie
    puts "That was a good #{cookie}!"
  end
  
  def celebrate_birthday
    @age+=1
  end
  
  def get_mad_at reindeer_name
    @reindeer_ranking.delete(reindeer_name)
    @reindeer_ranking << reindeer_name
  end
end


# santas=[]
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")
# p santas

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
100.times do
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
end

santas.each {|i| i.age=rand(140)}

santas.each {|i| p i.age.to_s + " // " + i.ethnicity + " // " + i.gender}