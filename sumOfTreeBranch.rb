#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def hasPathWithGivenSum(t, s)
    sum = 0
    l = 0
    sumArr = []
    def getBranchSum(t, sumArr, l, s)
        if t == nil
            return
        end
        sumArr[l] = t.value
        print sumArr
        if t.left == nil && t.right == nil
            sum = sumArr.sum
            puts sum
            print sumArr
            if sum == s
                return true
            end

        getBranchSum(t.left, sumArr, l + 1, s)
        getBranchSum(t.right, sumArr, l, s)
        end
        return false
    end
    getBranchSum(t, sumArr, l, s)
end