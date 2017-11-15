class Node
  attr_accessor :data, :next
  
  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end

class Queue
  def initialize(data)
    @head = Node.new(data, nil)
    @tail = Node.new(data, nil)
  end
  
  # Methods needed for Queues: add(item), remove(), peek(), isEmpty()
  
  # add method (checks if head is null - starts Queue if is, else adds new item as Head node, updates pointer to tail node)
  def add(item)
    if @head == nil
      @head.data = item
      @head.next = nil
      @tail = @head
    else
      current = @head
      newItem = Node.new(item, nil)
      newItem.next = current
      @head = newItem
    end
  end
  
  # peek() method - to display data stored in the head node
  def peek()
    puts @head.data
  end
  
  # remove() method - deletes the tail (FIFO concept), returns the data deleted from the Queue
  def remove()
    if @head == nil
      puts "There is nothing to remove."
    elsif @head.next == nil
      puts "#{@tail.data} has been removed from the Queue."
      @head = nil
      @tail = nil
    else
      current = @head
      prev = current
      while current.next != nil
        prev = current
        current = current.next
      end
      puts "#{@tail.data} has been removed from the Queue."
      current = prev
      current.next = nil
      @tail = current
    end
  end
  
  def showTail()
    puts @tail.data
  end
  
  # isEmpty() - boolean - returns true if empty, false if not
  def isEmpty()
    if @head == nil
      puts "This Queue is empty."
    else
      puts "This Queue has data."
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
  
end

jim = Queue.new(3)
jim.add(4)
jim.add(7)
jim.add(10)
jim.peek()
jim.remove()
jim.isEmpty
jim.showTail
jim.display_list