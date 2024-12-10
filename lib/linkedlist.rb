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
      @size -= 1
    end

    def contains?(val)
      node = @head

      until node.nil?
        return true if node.value == val

        node = node.next_node
      end

      false
    end

    def find(val)
      node = @head
      index = 0

      until node.nil?
        return index if node.value == val

        node = node.next_node
        index += 1
      end

      nil
    end

    def insert_at(val, index)
      new = Node.new
      new.value = val

      if index == 0
        new.next_node = @head
        @head = new
      elsif index == (@size - 1)
        @tail.next_node = new
        @tail = new
      else
        node = at(index - 1)
        new.next_node = node.next_node
        node.next_node = new
      end

      @size += 1
    end

    def remove_at(index)
      if index == 0
        node = @head
        @head = @head.next_node
        node.next_node = nil
        return
      elsif index == (@size - 1)
        @tail = at(index - 1)
        @tail.next_node = nil
      else
        node = at(index)
        previous_node = at(index - 1)
        previous_node.next_node = node.next_node
        node.next_node = nil
      end

      @size -= 1
    end

    private

    def to_s
      node = @head
      string_ver = ''

      until node.nil?
        string_ver << "( #{node.value} ) -> "
        node = node.next_node
      end
      string_ver << 'nil'
    end
  end
end
