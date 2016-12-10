# Creates a linear collection of data elements called Nodes
# Each node contains a data element and a pointer to the next Node
# A head Node is the first node; a tail Node is the last
# [head NODE] --> [Node] --> [(n)Nodes] --> [tail Node]
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node to the end of the list
  def append(value)
    new_node = Node.new(value: value)
    @tail.next_node = new_node if @tail
    @head = new_node unless @head
    @tail = new_node
  end

  # adds a new node to the front of the list
  def prepend(value)
    new_node = Node.new(value: value)
    new_node.next_node = @head if @head
    @tail = new_code unless @tail
    @head = new_node
  end

  # retuns the total number of nodes in the list
  def size
    counter = 0
    node = @head
    until node.nil?
      node = node.next_node
      counter += 1
    end
    counter
  end

  # returns the node at the given index
  def at(index)
    node = @head
    index.times do
      break if node.nil?
      node = node.next_node
    end
    node
  end

  # removes the last element from the list and returns pop'd node
  def pop
    mysize = size # runs LinkedList#size only once
    old_tail = @tail
    if mysize <= 1
      @head = nil
      @tail = nil
    else
      @tail = at(mysize - 2)
      @tail.next_node = nil
    end
    old_tail
  end

  # returns true if the passed value is in the list, otherwise, false
  def contains?(value)
    node = @head
    until node.value == value
      return false if node.next_node.nil?
      node = node.next_node
    end
    true
  end

  # returns the index of the node containing the value, otherwise, nil
  def find(value)
    # guard clause
    return nil if contains?(value) == false
    index = 0
    node = @head
    until node.value == value
      node = node.next_node
      index += 1
    end
    index
  end

  # returns LinkedList data as a string
  def to_s
    node = @head
    arr = []
    until node.nil?
      arr << node.value
      node = node.next_node
    end
    arr.join(' -> ')
  end

  # Element of a LinkedList object
  # Accepts a hash containing :value and :next_node pointer
  # :value attribute holds a data object
  # :next_node attribute contains pointer to one other Node object
  class Node
    attr_accessor :value, :next_node

    def initialize(args = {})
      @value = args.fetch(:value, nil)
      @next_node = args.fetch(:next_node, nil)
    end
  end
end
