class TodoList
  def initialize(array)
    @list=Array.new
    array.each {|i| @list << i}
    @list
  end
  
  def get_items
    p @list 
  end
  
  def add_item(item)
    @list << item
  end
  
  def delete_item(item)
    @list.delete(item)
  end
  
  def get_item(index)
    @list[index]
  end  
end
