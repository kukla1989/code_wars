#https://www.codewars.com/kata/52bef5e3588c56132c0003bc/train/ruby
class TreeNode
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value

  def initialize(value)
    @value = value
  end
end



base_node = TreeNode.new(1)
left_node = TreeNode.new(2)
l_left_node = TreeNode.new 4
left_node.left = l_left_node
right_node = TreeNode.new(3)
base_node.left = left_node
base_node.right = right_node


def tree_by_levels(node)
  stack = []
  stack.push node if node
  stack.each do |node|
    stack << node.left if node.left
    stack << node.right if node.right
  end
  stack.map! &:value
end


p tree_by_levels base_node