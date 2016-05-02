class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end


	def speak(x)
		puts "Woof!\n"*x
		
	end

	def roll_over
		puts "Roll over!"
	end

	def dog_years(y)
		y * 7
	end

	def sing
		puts "
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			I ain't sorry, *******, nah
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			I ain't sorry
			
			He trying to roll me up, I ain't picking up
			Headed to the club, I ain't thinking 'bout you
			Me and my ladies sip my D'USSÉ cup
			I don't give a fuck, chucking my deuces up
			Suck on my balls, pause, I had enough
			I ain't thinking 'bout you
			I ain't thinking 'bout
			
			Middle fingers up, put them hands high
			Wave it in his face, tell him, boy, bye
			Tell him, boy, bye, middle fingers up
			I ain't thinking 'bout you
			
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			I ain't sorry, *******, nah
			I ain't thinking 'bout you
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			No no, hell nah
			
			Now you want to say you're sorry
			Now you want to call me crying
			Now you gotta see me wilding
			Now I'm the one that's lying
			And I don't feel bad about it
			It's exactly what you get
			Stop interrupting my grinding
			I ain't thinking 'bout you
			
			Sorry, I ain't sorry
			I ain't thinking 'bout you
			I ain't thinking 'bout you
			Sorry, I ain't sorry
			I ain't thinking 'bout you
			I ain't thinking 'bout you
			
			Middle fingers up, put them hands high
			Wave it in his face, tell him, boy, bye
			Tell him, boy, bye, boy, bye
			Middle fingers up, I ain't thinking 'bout you
			
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			I ain't sorry, *******, nah
			Sorry, I ain't sorry
			Sorry, I ain't sorry
			I ain't sorry
			No no, hell nah
			
			Looking at my watch, he shoulda been home
			Today I regret the night I put that ring on
			He always got them fucking excuses
			I pray to the Lord you reveal what his truth is
			I left a note in the hallway
			By the time you read it, I'll be far away
			I'm far away
			But I ain't fucking with nobody
			Let's have a toast to the good life
			Suicide before you see this tear fall down my eyes
			Me and my baby, we gon' be alright
			We gon' live a good life
			Big homie better grow up
			Me and my whoadies 'bout to stroll up
			I see them boppers in the corner
			They sneaking out the back door
			He only want me when I'm not there
			He better call Becky with the good hair
			He better call Becky with the good hair
			"
		end

		def initialize
			puts "Initializing new puppy insance"
		end
end


beyonce = Puppy.new
beyonce.fetch("Iggy")

beyonce.speak(5)
beyonce.roll_over
puts beyonce.dog_years(4)
beyonce.sing


class Khaleesi

	def initialize
		puts "I am sexy girl from house Targaryan. I had a bad brother and I'm a sexy girl."
	end

	def dragons_counter(x)
		puts " I have #{x} dragons. I lose them sometimes because they are hungry and I have no 
		idea what I'm doing at anytime."
	end

	def location
		places = []
		places << "The Red Keep" << "Dorne" << "Winterfell" << "Braavos" << "Mereen"
		puts places.sample
	end

end

counter = 0
   locations = Array.new
while counter < 50

	locations << Khaleesi.new

counter += 1

end
	locations.each do |servants|
		servants.dragons_counter(rand(10))
		servants.location
	end




























