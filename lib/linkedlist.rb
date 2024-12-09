# frozen_string_literal: true

require_relative 'node'

module List
  # Represent a linked list
  class LinkedList
    include List

    attr_reader :head, :tail, :size

    def initialize
      @size = 0
      @head = nil
      @tail = nil
    end

    def append(val)
      if @head.nil?
        @head = Node.new
        @head.value = val
      elsif @tail.nil?
        @tail = Node.new
        @tail.value = val
        @head.next_node = @tail
      else
        new = Node.new
        new.value = val
        @tail.next_node = new
        @tail = new
      end

      @size += 1
    end

    def prepend(val)
      new = Node.new
      new.value = val
      new.next_node = @head
      @head = new
      @size += 1
    end

    def at(index)
      count = 0
      node = @head
      until count == index
        node = node.next_node
        count += 1

        if node.nil?
          puts "Node at index #{index} does not exist"
          return
        end
      end

      node
    end

    def pop
      node = @head

      node = node.next_node until node.next_node == @tail

      node.next_node = nil
      @tail = node
    end

    def to_s
      node = @head

      until node.nil?
        print "(#{node.value}) -> "
        node = node.next_node
      end
      puts 'nil'
    end
  end
end
