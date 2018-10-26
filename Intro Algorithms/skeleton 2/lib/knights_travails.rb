require_relative "00_tree_node"

class KnightPathFinder

  def initialize(pos)
    @visited_positions = [pos]
  end

  def self.build_move_tree(pos)

  end

  def self.valid_moves(pos)
    moves = [[2,-1], [2,1], [-2,-1], [-2,1], [1,-2], [1,2], [-1,-2], [-1,2] ]

    moves.map! do |move|
      move1 = pos[0] + move[0]
      move2 = pos[1] + move[1]
      [move1, move2]
    end

    moves.reject {|square| square.any? {|num| num < 0 || num > 7}}
  end

  def new_move_positions(pos)
    all_moves = KnightPathFinder.valid_moves(pos)
    all_moves.reject { |square| @visited_positions.include?(square) }
  end

end
k = KnightPathFinder.new([0,0])
p k.new_move_positions([1,2])
# p KnightPathFinder.valid_moves([7, 7])
