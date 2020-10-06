# frozen_string_literal: true

# Represents a node in a balanced binary search tree
class Node
  attr_reader :value
  attr_accessor :left_leaf, :right_leaf

  def initialize(value)
    @value = value
    @left_leaf = nil
    @right_leaf = nil
  end
end
