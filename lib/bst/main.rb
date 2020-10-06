require_relative 'tree'

my_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

my_tree.traverse(my_tree.root)

my_tree.insert(121)

my_tree.traverse(my_tree.root)

one_node = my_tree.find(4)
puts one_node
puts one_node.value

my_tree.pretty_print

my_tree.delete(121)

my_tree.pretty_print

inorder_array = my_tree.inorder
preorder_array = my_tree.preorder
postorder_array = my_tree.postorder

puts inorder_array
puts "\n"
puts preorder_array
puts "\n"
puts postorder_array
puts "\n"
