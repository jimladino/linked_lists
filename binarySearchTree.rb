class Node
  attr_accessor :data, :left, :right
  
  def initialize(data, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end
end

def createMinimalBST(array)
  arr = array
  arrStart = 0
  arrEnd = arr.length-1   
  def createTree(arr, arrStart, arrEnd)
    mid = (arrStart + arrEnd) / 2
    if arrEnd < arrStart
    return
    end
    n = Node.new(arr[mid])
    n.left = createTree(arr, arrStart, mid - 1)
    n.right = createTree(arr, mid + 1, arrEnd)
    puts n.data
  end
  createTree(arr,arrStart,arrEnd)
end

createMinimalBST([1,2,3,4,5,6,7,8,9])
    