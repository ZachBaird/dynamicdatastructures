require_relative 'linked_list'

my_list = LinkedList.new

my_list.append(5)
my_list.append(3)
my_list.append(6)
my_list.append(9)

my_list.prepend(10)

list_size = my_list.size

head = my_list.head
tail = my_list.tail

at_pos_three = my_list.at(3)

my_list.pop

puts list_size
puts head.value
puts tail.value
puts at_pos_three

tail = my_list.tail
puts tail.value

three_exists = my_list.contains?(3)
eleven_exists = my_list.contains?(11)

puts three_exists
puts eleven_exists

index_of_ten = my_list.find(10)
index_of_five = my_list.find(5)
index_of_eleven = my_list.find(11)

puts index_of_ten
puts index_of_five
puts index_of_eleven

string_representation_of_list = my_list.to_s

puts string_representation_of_list
