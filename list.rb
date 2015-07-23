require_relative 'node'

class LinkedList
	attr_accessor :head, :data

	def initialize(data = nil)
		@head = nil
	end

	def append(data)
		if @head == nil
			@head = Node.new(data)
		else
			current = @head
		until current.next_node == nil
			current = current.next_node
		end
			current.next_node = Node.new(data)
		end
	end

	def prepend(data)
		node = Node.new(data)
		node.next_node = @head
		@head = node
	end

	def insert(data, position)
		before = @head
		(position-1).times {before = before.next_node}
		after = before.next_node
		before.next_node = Node.new(data)
		before.next_node.next_node = after
	end

	def includes?(data)
		current = @head
		until current.data == data || current.next_node == nil
			current = current.next_node
		end
		current.data == data
	end

	def pop
		current = @head
		until current.next_node.next_node == nil
			current = current.next_node
		end
		current.next_node = nil
	end

	def count
		count = 0
		current = @head
		until current == nil
			current = current.next_node
			count += 1
		end
		count
	end

	def head_value
		current = @head
	end 

	def tail_value
		current = @head
		until current.next_node == nil
			current = current.next_node
		end
		current
	end

	def find_by_index(index)
		return nil if index < 0 || index >= count
		current = @head
		index.times {current = current.next_node}
		current
	end

	def find_by_value(data)
		current = @head
		index = 0
		until current == nil
			return index if current.data == data
			current = current.next_node
			index +=1
		end
		nil
	end

	def remove_by_index(index)
		if index == 0
		@head = find_by_index(1) 
		elsif index < 0 || index >= count
			"error"
		else
			find_by_index(index-1).next_node = find_by_index(index+1)
		end
	end

	def remove_by_value(data)
		if index = find_by_value(data)
			remove_by_index(index)
		end
	end

	def distance(starting_index, ending_index)
		return if find_by_value(ending_index) == nil || find_by_value(starting_index) == nil
		(find_by_value(ending_index)-find_by_value(starting_index)).abs
	end
end




