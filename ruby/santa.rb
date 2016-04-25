Class Santa
  def initialize(name)
    @name=name
    @location="the North Pole"
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end
  
  def eat_milk_and_cookies cookie
    puts "That was a good #{cookie}!"
  end


santa=Santa.new
santa.speak
santa.eat_milk_and_cookies snickerdoodle