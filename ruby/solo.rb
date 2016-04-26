#Solo Challenge - Design and Implement a Class
#3 attributes using at least 2 data types
#3 methods one of with takes an argument

#Create Blackjack class (Aces will be worth 1)
# =>Each initialization will start with read only attribues of card1, card2, current_total
# =>Read/write attr will include facial_expression, drink
# =>Methods will include hit, stay, facial_expression, drink

class Blackjack
  attr_reader :card1, :card2, :current_total
  attr_accessor: :facial_expression, :drink
  
  def initialize
    @card1 = rand(9)+1
    @card2 = rand(9)+1
    @current_total = @card1+@card2
    @facial_expression = "-_-"
    @drink = "water"
  end
  
  def hit
    @current_total += rand(9)+1
  end
  
  def stay
    puts "Your cards = #{@current_total}"
    dealer_total=rand(9)+16
    puts "Dealer cards = #{dealer_total}"
    if @current_total>21
      puts "BUST!!!"
      puts "At least you didn't lose your #{@drink} too..."
      @facial_expression = ">:O"
    elsif @current_total<21
      if @current_total>dealer_total
        puts "YOU WIN!!!!"
        @facial_expression=":D"
      else
        puts "You lose to the dealer..."
        @facial_expression="T_T"
      end
    elsif @current_total==21
      puts "YOU GOT BLACKJACK!!!"
      @facial_expression="^_^"
    end
    puts "#{@facial_expression}"
  end
    
  def facial_expression(face)
    @facial_expression=face
    puts "Current facial expression: #{@facial_expression}"
  end
  
  def drink(drink)
    @drink=drink
    puts "Current drink: #{@drink}"
  end
end

