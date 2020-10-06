# frozen_string_literal: true

# Represents a node in a linked list
class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end
