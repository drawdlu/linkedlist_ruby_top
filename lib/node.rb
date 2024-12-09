# frozen_string_literal: true

module List
  # A node in the list
  class Node
    attr_accessor :value, :next_node

    def initialize
      @value = nil
      @next_node = nil
    end
  end
end
