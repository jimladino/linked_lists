class Node
  attr_accessor :data, :next
  
  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end

class Stack
  def initialize(data)
    @head = Node.new(data, nil)
    @min = Node.new(data, nil)
  end
  
  # Methods needed for Queues: push(item), pop(), peek(), isEmpty(), min() - pops min and returns value
  
  # push() method (checks if head is null - starts Stack if is, else adds new item as Head node)
  def push(item)
    if @head == nil
      @head.data = item
      @head.next = nil
      @min = @head
    else
      current = @head
      newItem = Node.new(item, nil)
      if(item < @min.data)
        curMin =@min
        newMinItem = Node.new(item, nil)
        newMinItem.next = curMin
        @min = newMinItem
        puts "#{@min.data} is the new minimum!"
      end
      newItem.next = current
      @head = newItem
    end
  end
  
  # peek() method - to display data stored in the head node
  def peek()
    puts @head.data
  end
  
  # pop() method - deletes the head (LIFO concept), returns the data deleted from the Stack
  def pop()
    if @head == nil
      puts "There is nothing to remove."
    elsif @head.next == nil
      puts "#{@head.data} has been removed from the Stack."
      @head = nil
      @min = nil
    else
      puts "#{@head.data} has been removed from the Stack."
      if(@head.data == @min.data)
        curMin = @min
        @min = curMin.next
        puts "#{@min.data} is the new Minimum Value."
      end
      current = @head
      @head = current.next
    end
  end
  # isEmpty() - boolean - returns true if empty, false if not
  def isEmpty()
    if @head == nil
      puts "This Stack is empty."
    else
      puts "This stack has data."
    end
  end
  
  def display_list
    current = @head
    while current.next != nil
      puts current.data
      current = current.next
    end
    puts current.data
  end

  def display_minList
    curMin = @min
    while curMin.next != nil
      puts curMin.data
      curMin = curMin.next
    end
    puts curMin.data
  end  

  def displayMin()
    @m = []
    current = @head
    while current.next != nil
      @m.push(current.data)
      current = current.next
    end
    @m.push(current.data)
    @m.sort!
    puts "#{@m[0]} is the minimum value in the stack."
  end
  
  def popMin()
    if @head == nil
      puts "There is nothing to remove."
    elsif @head.next == nil
      puts "#{@head.data} has been removed from the Queue."
      @head = nil
      @min = nil
    else
      current = @head
      prev = @head
      while current.data != @min.data
        prev = current
        current = current.next
      end
      puts "#{current.data} has been removed from the stack"
      if current.next == nil
        current = prev
        prev.next = nil
      elsif current.data == @head.data
        @head = current.next
      else
        prev.next = current.next
        current = prev
      end
      curMin = @min
      @min = curMin.next
    end
  end
end

jim = Stack.new(3)
jim.push(2)
jim.push(7)
jim.push(10)
jim.push(1)
puts "Stack is updated.  Execute peek():"
jim.peek()
puts "Execute pop()"
jim.pop()
puts "Check if stack is empty with isEmpty():"
jim.isEmpty
puts "Display New Stack"
jim.display_list()
puts "Show the minimum value using an array:"
jim.displayMin()
puts "delete the minimum value in the stack:"
jim.popMin()
puts "New Stack"
jim.display_list
puts "New Minimum List"
jim.display_minList