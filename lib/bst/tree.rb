# frozen_string_literal: true

require_relative 'node'

# A balanced binary search tree
class Tree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    root = Node.new(arr.shift)

    arr.each { |x| push_node(root, x) }

    root
  end

  def traverse(node)
    return if @root.nil? || node.nil?

    traverse(node.left_leaf) if node.left_leaf
    puts node.value
    traverse(node.right_leaf) if node.right_leaf
  end

  def insert(value)
    insert_traversal(@root, value)
  end

  private

  def insert_traversal(node, value)
    if value < node.value && node.left_leaf
      insert_traversal(node.left_leaf)
    elsif value < node.value && !node.left_leaf
      node.left_leaf = Node.new(value)
    elsif value > node.value && node.right_leaf
      insert_traversal(node.right_leaf)
    elsif value > node.value && !node.right_leaf
      node.right_leaf = Node.new(value)
    end
  end

  def push_node(node, value)
    if value > node.value
      return push_node(node.right_leaf, value) if node.right_leaf

      node.right_leaf = Node.new(value)
    else
      return push_node(node.left_leaf, value) if node.left_leaf

      node.left_leaf = Node.new(value)
    end
  end
end
