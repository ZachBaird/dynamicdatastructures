# frozen_string_literal: true

require_relative 'node'

# A balanced binary search tree
class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree arr
  end

  def build_tree(arr)
    arr = arr.uniq
    root = Node.new(arr.shift)

    arr.each { |x| push_node(root, x) }

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_leaf, "#{prefix}#{is_left ? '│ ' : ' '}", false) if node.right_leaf
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_leaf, "#{prefix}#{is_left ? ' ' : '│ '}", true) if node.left_leaf
  end

  def traverse(node = @root)
    return if node.nil?

    traverse node.left_leaf if node.left_leaf

    puts node.value

    traverse node.right_leaf if node.right_leaf
  end

  def insert(value)
    insert_traversal @root, value
  end

  def delete(value, node = @root)
    if node.value == value
      if one_leaf?(node)
        @root = node.left_leaf || node.right_leaf
      else
        next_right_num = node.right_leaf
        second_smallest = next_right_num

        second_smallest = second_smallest.left_leaf while second_smallest.left_leaf.left_leaf

        node.value = second_smallest.left_leaf.value
        second_smallest.left_leaf = second_smallest.left_leaf.right_leaf
      end
    elsif node.left_leaf && node.left_leaf.value == value
      if leaf?(node.left_leaf)
        node.left_leaf = nil
      elsif one_child?(node.left_leaf)
        node.left_leaf = node.left_leaf.left_leaf || node.left_leaf.right_leaf
      else
        next_right_num = node.left_leaf.right_leaf
        second_smallest = next_right_num

        second_smallest = second_smallest.left_leaf while second_smallest.left_leaf.left_leaf

        node.left_leaf.value = second_smallest.left_leaf.value
        second_smallest.left_leaf = second_smallest.left_leaf.right
      end
    elsif node.right_leaf && node.right_leaf == value
      if leaf?(node.right_leaf)
        node.right_leaf = nil
      elsif one_child?(node.right_leaf)
        node.right_leaf = node.right_leaf.left_leaf || node.right_leaf.right_leaf
      else
        next_right_num = node.left_leaf.right_leaf
        second_smallest = next_right_num

        second_smallest = second_smallest.left_leap while second_smallest.left_leaf.left_leaf

        node.right_leaf.value = second_smallest.left_leaf.value
        second_smallest.left_leaf = second_smallest.left_leaf.right_leaf
      end
    else
      if value < node.value
        delete value, node.left_leaf
      else
        delete value, node.right_leaf
      end
    end
  end

  def find(value, node = @root)
    return if node.nil?
    return node if node.value == value

    if value < node.value
      find value, node.left_leaf
    else
      find value, node.right_leaf
    end
  end

  private

  def insert_traversal(node, value)
    if value < node.value && node.left_leaf
      insert_traversal(node.left_leaf, value)
    elsif value < node.value && !node.left_leaf
      node.left_leaf = Node.new(value)
    elsif value > node.value && node.right_leaf
      insert_traversal(node.right_leaf, value)
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

  def leaf?(node)
    node.left_leaf.nil? && node.right_leaf.nil?
  end

  def one_leaf?(node)
    (node.left_leaf && node.right_leaf.nil?) ||
      (node.left_leaf.nil? && node.right_leaf)
  end
end
