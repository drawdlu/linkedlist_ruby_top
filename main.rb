# frozen_string_literal: true

require_relative 'lib/linkedlist'

list = List::LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.prepend('test')
list.prepend('try')
list.append('turtle')

puts list

puts list.size
