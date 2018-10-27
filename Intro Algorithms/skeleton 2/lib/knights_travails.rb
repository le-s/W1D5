require_relative "00_tree_node"

class KnightPathFinder

  def initialize(pos)
    @start_pos = pos
    @visited_positions = [pos]
  end

  def self.build_move_tree(target_pos)
    queue = [@start_pos]
    until queue.empty?
      square = queue.shift
      return square if square == target_pos
      queue += new_move_positions(square)
    end
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
    all_moves.reject! { |square| @visited_positions.include?(square) }
    @visited_positions += all_moves
  end

  def find_path

  end

end

# k = KnightPathFinder.new([0,0])
# p k.new_move_positions([1,2])
# p KnightPathFinder.valid_moves([7, 7])
