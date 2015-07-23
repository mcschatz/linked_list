require 'simplecov'
SimpleCov.start

gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'list'


class LinkedListTest < Minitest::Test

 	def test_one_node_can_append_a_node
 		list = LinkedList.new
		list.append('1')

 		assert_equal '1', list.head.data
 	end

 	def test_one_node_can_append_a_second_node
 		list = LinkedList.new
		list.append('1')
 		list.append('2')

 		assert_equal '2', list.head.next_node.data
 	end

 	def test_a_node_of_nil_can_be_appended
 		list = LinkedList.new
		list.append('1')
 		list.append(nil)

 		assert_equal nil, list.head.next_node.data
 	end

 	def test_a_node_can_be_prepended
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.prepend('3')

 		assert_equal '3', list.head.data
	end

	def test_a_node_can_be_prepended_an_empty_list
 		list = LinkedList.new
 		list.prepend('1')

 		assert_equal '1', list.head.data
	end

	def test_a_node_of_nil_can_be_prepended
		list = LinkedList.new
		list.append('1')
		list.prepend(nil)

		assert_equal nil, list.head.data
	end

	def test_a_node_can_be_inserted
		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.insert('4', 2)

 		assert_equal '4', list.head.next_node.next_node.data
 	end

 	def test_a_node_can_be_inserted_in_another_position
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.insert('4', 1)

 		assert_equal '4', list.head.next_node.data
 	end

 	def test_it_can_find_a_specific_node
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')

 		assert list.includes?('3')
 	end

 	def test_it_refutes_a_node_that_is_not_present
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')

 		refute list.includes?('4')
 	end

 	def test_it_can_pop_an_element_from_the_end_of_the_list
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.pop

 		assert_equal nil, list.head.next_node.next_node
 	end

 	# def test_it_can_handle_pop_if_the_list_is_empty
 	# 	list = LinkedList.new
 	#
 	# 	assert_equal "List is empty", list.pop
 	# end

 	def test_it_can_count_the_elements_a_list
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')

 		assert_equal 3, list.count
 	end

 	def test_it_can_count_the_elements_of_an_empty_list
 		list = LinkedList.new

 		assert_equal 0, list.count
 	end

 	def test_it_can_put_the_head_value
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')

 		assert_equal "1", list.head_value.data
 	end

 	def test_it_can_put_the_head_value_of_an_empty_list
 		list = LinkedList.new
 		assert_equal nil, list.head_value
 	end

 	def test_it_can_put_the_tail_value
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')

 		assert_equal "2", list.tail_value.data
 	end

 	# def test_it_can_return_nil_if_there_is_no_tail
 	# 	list = LinkedList.new
 	# 	assert_equal nil, list.tail_value
 	# end

 	def test_it_can_find_by_index
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal "3", list.find_by_index(2).data
 	end

 	def test_it_can_find_another_by_index
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal "1", list.find_by_index(0).data
 	end

 	def test_it_returns_nil_if_index_not_present
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal nil, list.find_by_index(9) #when I call data on this it breaks
 	end

 	def test_it_can_find_by_value
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal 1, list.find_by_value('2')
 	end

 	def test_it_returns_nil_if_value_not_in_list
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal nil, list.find_by_value('10')
 	end

 	def test_it_can_remove_by_index
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal '4', list.remove_by_index(2).data
 	end

	def test_it_can_remove_by_value
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal '3', list.remove_by_value('2').data
 	end

 	def test_it_returns_nil_if_value_not_present
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal nil, list.remove_by_value('8')
 	end

 	def test_it_can_find_the_distance_between_two_nodes
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal 3, list.distance("1", "4")
 	end

 	def test_it_returns_nil_if_node_not_present
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal nil, list.distance("1", "9")
 	end

 	def test_it_returns_nil_if_list_is_empty
 		list = LinkedList.new

 		assert_equal nil, list.distance("1", "4")
 	end

 	def test_it_can_find_the_absolute_value_between_two_nodes
 		list = LinkedList.new
 		list.append('1')
 		list.append('2')
 		list.append('3')
 		list.append('4')

 		assert_equal 3, list.distance("4", "1")
 	end
end
