array = ['item 1', 'item 2', 'item 3', 'item 4']
hash = {'grass'=>'green', 'sky'=>'blue', 'clouds'=>'white', 'dirt'=>'brown'}

p array.each {|item| puts item}
p hash.each {|thing, color| "#{thing} is the color of #{color}"}

p array.map {|item| '5' }
p array

p array.map! {|item| item.next }
p array

p hash.map {|thing, color| "#{thing} is not the color #{color.next}"}
p hash

#Release 2
array = [1, 2, 3, 4, 5, 6, 6, 7, 7, 9]
hash = {1 => "one", 2 => "two", 3 => "three", 4 => "four"}

#p array

#p array.delete_if {|number| number < 5}
#p array.keep_if {|number| number < 5}
#p array.select { |number| number.even? }
#p array.drop_while { |number| number > 5}

#p hash

#p hash.delete_if {|key, value| key < 3}
#p hash.keep_if {|key, value| key < 3}
#p hash.select {|key, value| key.even?}
#keep_if also stops executing the block when condition evaluates to false