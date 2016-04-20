def build_array(a, b, c)
    [a, b, c]
end

def add_to_array(arr, obj)
    arr << obj
    arr
end


var = []
p var

var << 1 << 2 << 3 << 4 << 5
p var

var.delete_at(2)
p var

var.insert(2, "thing")
p var

var.shift
p var

x = 1
var.include?(x)

p "includes? 1 #{var.include?(x)}"

var2 = [1, 2, 3]

var3 = var2 + var

p var3