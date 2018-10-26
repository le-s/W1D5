class PolyTreeNode

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(node)
    @parent = node
  end

  def children
    @children
  end

  def value
    @value
  end



end
