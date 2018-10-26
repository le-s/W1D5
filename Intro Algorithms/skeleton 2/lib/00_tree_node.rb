class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(node)
    if @parent == nil
      @parent = node
      node.children << self
    elsif node == nil
      @parent.children.delete(self)
      @parent = nil
    else
      unless @parent == node
        temp_parent = @parent
        temp_parent.children.delete(self)
        @parent = node
        node.children << self
      end
    end
  end

  def children
    @children
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    child_node.parent=(nil)
  end

  def value
    @value
  end

  def dfs(target_value)
    return self if self.value == target_value
    found_node = nil

    unless self.children.empty?
      self.children.each do |child|
        found_node = child.dfs(target_value)
        return found_node if found_node
      end
    end

    found_node
  end

end
