class Node
  attr_accessor :data, :next
  
  def initialize(data, next_node)
    @data = data
    @next = next_node
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
  
  def removekFromList(k)
    current = @head
    result = []
    if current == nil
        return "[]"
    else
        prev = Node.new(1, nil)
        
        while current.next != nil
            if k == @head.data
                @head = current.next
                current = @head
                result.push(current.data)
                current = current.next
            elsif k == current.data && k != @head.data
                prev.next = current.next
                current = prev
                current = current.next
                result.push(current.data)
                current = current.next
            else
               prev = current
               result.push(current.data)
               current = current.next
            end
        end
        result.push(current.data)
    end
    print result
  end
end

jim = LinkedList.new(3)

jim.display_list

puts "This is the head."

jim.addToEnd(1)
jim.addToEnd(2)
jim.addToEnd(3)
jim.addToEnd(4)
jim.addToEnd(5)

jim.display_list

jim.removekFromList(3)

jim.display_list