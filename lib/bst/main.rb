require_relative 'tree'

my_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

my_tree.traverse(my_tree.root)