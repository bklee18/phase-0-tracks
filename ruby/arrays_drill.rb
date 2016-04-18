def build_array(input1, input2, input3)
  array=[]
  array << input1 << input2 << input3
end

def add_to_array(array, item)
  array << item
end
  
#release 1
array1 = []
p array1

array1 << "item1" << "item2" << "item 3" << "item4" << "item5"
p array1

array1.delete_at(2)
p array1

array1.insert(2, "new_item")
p array1

array1.shift
p array1

if array1.include?("item4")
  p "array1 includes item4"
end

array2 = ["item5", "item6", "item7"]
p array2

array3 = array1 + array2
p array3

p build_array(1,2,3)
p add_to_array([], 'a')
p add_to_array(['a', 'b', 'c', 1, 2], 3)