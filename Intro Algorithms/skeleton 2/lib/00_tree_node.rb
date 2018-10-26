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

  def value
    @value
  end



end
