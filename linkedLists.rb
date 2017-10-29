class Node
  attr_accessor :data, :next
  
  def initialize(data, nextt_node)
    @data = data
    @next = nextt_node
  end
end

class LinkedList
  def initialize(data)
    @head = Node.new(data, nil)
  end
  
  def addToEnd(data)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(data, nil)
  end
  
  def addToHead(data)
    current = @head
    newHead = Node.new(data, nil)
    newHead.next = current
    @head = newHead
  end
  
  def addInMiddle(position, val)
    newVal = Node.new(val, nil)
    current = @head
    while current.data != position
      current = current.next
    end
    newVal.next = current.next
    current.next = newVal
  end

  def deleteTail
    current = @head
    prev = Node.new(current.data, nil)
    while current.next != nil
      prev = current
      current = current.next
    end
    current = prev
    current.next = nil
  end
  
  def deleteNode(val)
    current = @head
    delNode = val
    prev = Node.new(current.data, nil)
    if delNode == @head.data
      @head = current.next
      current = @head
    else
      while current.data != delNode
        prev = current
        current = current.next
      end
      prev.next = current.next
      current = prev
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

jim = LinkedList.new(10)

jim.display_list

puts "This is the head."

jim.addToEnd(17)
jim.addToEnd(9)
jim.addToEnd(49)
jim.addToEnd(29)

jim.display_list

puts "Now let's add to the Head."
jim.addToHead(100)

jim.display_list

puts "Delete tail of Linked List"

jim.deleteTail
jim.display_list

puts "Let's delete an individual node - 9."
jim.deleteNode(9)
jim.display_list

puts "Adding a value in the middle of the linked list - after 10..."
jim.addInMiddle(10, 201)
jim.display_list