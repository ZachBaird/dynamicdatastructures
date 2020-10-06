# frozen_string_literal: true

# Represents a node in a binary tree
class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def push_node(node, value)
  if value > node.value
    if node.right
      push_node(node.right, value)
    else
      node.right = Node.new(value)
    end
  else
    if node.left
      push_node(node.left, value)
    else
      node.left = Node.new(value)
    end
  end
end

def create_binary_tree(arr)
  root = Node.new(arr.shift)

  arr.each { |x| push_node(root, x) }

  root
end

def traverse_in_order(node)
  return if node.nil?

  traverse_in_order(node.left) if node.left

  puts node.value

  traverse_in_order(node.right) if node.right
end

def traverse_reverse_order(node)
  return if node.nil?

  traverse_reverse_order(node.right) if node.right

  puts node.value

  traverse_reverse_order(node.left) if node.left
end

# Tests
test_arr = [5, 7, 1, 15, 9, 2, 14, 8, 7, 3]
# test_arr = [5, 6, 2, 4, 1, 8, 7, 9, 3]

result = create_binary_tree(test_arr)

traverse_in_order(result)
traverse_reverse_order(result)