require_relative 'node'

# A linked list
class LinkedList
  attr_accessor :list

  def initialize
    @list = nil
  end

  def append(value)
    if @list.nil?
      @list = Node.new(value)
    else
      tail_node = traverse_to_tail(@list)
      tail_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @list.nil?
      @list = Node.new(value)
    else
      new_head_node = Node.new(value)
      new_head_node.next_node = @list
      @list = new_head_node
    end
  end

  def size
    finished_traversal = false
    count = 0
    current_node = @list

    until finished_traversal
      finished_traversal = true if current_node.next_node.nil?

      count += 1
      current_node = current_node.next_node
    end

    count
  end

  def head
    @list
  end

  def tail
    traverse_to_tail(@list)
  end

  def at(index)
    count = 0
    current_node = @list

    until count == index
      current_node = current_node.next_node
      count += 1
    end

    count
  end

  def pop
    current_node = @list
    popped = false

    until popped
      if current_node.next_node.next_node.nil?
        current_node.next_node = nil
        popped = true
      end

      current_node = current_node.next_node
    end
  end

  def contains?(value)
    found = false
    current_node = @list

    until found || current_node.next_node.nil?
      if current_node.value == value
        found = true
      end

      current_node = current_node.next_node
    end

    found
  end

  def find(value)
    index = 0
    current_node = @list

    until current_node.next_node.nil?
      break if current_node.value == value

      index += 1

      current_node = current_node.next_node
    end

    # Just gonna return a -1 if we didn't find the value for now
    return -1 if current_node.value != value

    index
  end

  def to_s
    result = ''
    current_node = @list

    until current_node.nil?
      result << "(#{current_node.value}) ~> "

      current_node = current_node.next_node

      result << 'nil' if current_node.nil?
    end

    result
  end

  private

  def traverse_to_tail(node)
    if node.next_node
      traverse_to_tail(node.next_node)
    else
      node
    end
  end
end
