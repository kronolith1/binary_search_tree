class Node
  attr_accessor :data, :left_child, :right_child

  def initialize(data, left_child=nil, right_child=nil)
    @data = data
    @left_child = left_child
    @right_child = right_child
  end

  def <=>(other)
    data <=> other.data
  end
end


class Tree
  def initialize(array)
    @array = array
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.uniq.sort
    root_node = sorted_array_to_bst(array, 0, array.length - 1)
  end

  def sorted_array_to_bst(array, start, last)
    return nil if start > last

    mid = ((start + last) / 2.0).round
    root = Node.new(array[mid])

    root.left_child = sorted_array_to_bst(array, start, mid - 1)
    root.right_child = sorted_array_to_bst(array, mid + 1, last)

    return root
  end

  def insert(value, root=@root)
    return Node.new(value) if root.nil?

    if value < root.data
      root.left_child = insert(value, root.left_child)
    elsif value > root.data
      root.right_child = insert(value, root.right_child)
    end

    return root
  end

  def delete(value)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end


array = [1, 7, 4, 5, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
bst_tree = Tree.new(array)
puts bst_tree.pretty_print
bst_tree.insert(69)
puts bst_tree.pretty_print