# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative can import another Ruby file's information
# require is more elaborate than require_relative way to import another Ruby file.
require_relative 'state_data'

class VirusPredictor
  # Initializes a new instance of the VirusPredictor class with the passed in parameters.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end


  # virus_effects executes the predicted_deaths instance method and speed_of_spread instance method.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  # anything beneath private cannot be called in the driver code, but other instance methods can still use methods under 'private'
  # use case: NCAA march madness algorithm. Useful for user to see which schools made it, but would not want schools to know the underlying calculations.
  private

  # predicted_deaths applies conditional logic to the population_density attribute and returns
  # a statement with the number_of_deaths calcuated from the conditional logic and the population attribute
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      num = 0.4
    elsif @population_density >= 150
      num = 0.3
    elsif @population_density >= 100
      num = 0.2
    elsif @population_density >= 50
      num = 0.1
    else
      num = 0.05
    end
    number_of_deaths = (@population * num).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # speed_of_spread method takes the population_density attribute and applies a conditional logic to
  # determine how quickly the virus will spread across the state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
state_array = Array.new

STATE_DATA.each_key do |state_name|
  pop_dens = STATE_DATA[state_name][:population_density]
  pop = STATE_DATA[state_name][:population]
  state_array << VirusPredictor.new(state_name, pop_dens, pop)
end

state_array.each { |state| state.virus_effects }

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================


=begin     ********* REFLECTION **********
1. The 2 differences is that the first level of hash uses a string as a key and the second level uses a symbol as a key.
2. require_relative specifices a local Ruby file to be imported while require is more elaborate in its requirement and execution.
3. Different ways to iterate through a hash is .EACH, .EACH_KEY, .EACH_VALUE
4. When refactoring virus_effects, the thing that stood out was that all the parameters were attributes, and since they were 
attributes, they were accesssible throughout the class.
5. I solidified how to iterate through complex data structures (in this case a hash with a nested hash). I found it's important
to look at each level independtly of its parent data structure, so each state in STATE_DATA is now just an individual hash.
