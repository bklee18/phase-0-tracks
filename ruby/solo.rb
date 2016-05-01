#Create Blackjack class (Aces will be worth 1)
# =>Each initialization will start with attribute card1 and card 2 and read only attribuete of current_total
# =>Read/write attr will include facial_expression, drink
# =>Methods will include hit, stay, change_facial_expression, drink

class Blackjack
  attr_reader :current_total
  attr_accessor :facial_expression, :drink
  
  def initialize
    card1 = rand(9)+1
    card2 = rand(9)+1
    @current_total = card1+card2
    @facial_expression = "-_-"
    @drink = "water"
    puts "Card 1: #{card1}"
    puts "Card 2: #{card2}"
  end
  
  def hit
    next_card = rand(9)+1
    puts "Next card: #{next_card}"
    @current_total += next_card
    puts "Your card total: #{current_total}"
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
      if @current_total>dealer_total || dealer_total>21
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
    
  def change_facial_expression(face)
    @facial_expression=face
    puts "New facial expression: #{@facial_expression}"
  end
  
  def drink(drink)
    @drink=drink
    puts "Current drink: #{@drink}"
  end
end

def interface
  puts "\n Brian's BLACKJACK Simulator 1.0 \n"
  hand=Blackjack.new
  choice=String.new
  while true
    puts "\n Options: face, drink, hit, stay, quit"
    choice=gets.chomp
    if choice=='face'
      puts hand.facial_expression
      puts "Enter new facial expression"
      face=gets.chomp
      hand.change_facial_expression(face)
    elsif choice=='drink'
      puts "Enter your drink order"
      drink=gets.chomp
      hand.drink(drink)
    elsif choice=='hit'
      hand.hit
    elsif choice=='stay'
      hand.stay
      break
    elsif choice=="quit"
      break
    end
  end
  puts "Play another round? (y/n)"
  answer=gets.chomp
  if answer=='y'
    interface
  end
end

interface