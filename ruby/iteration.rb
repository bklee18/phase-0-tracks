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