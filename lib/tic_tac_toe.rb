class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    (@board[index]=="X"||@board[index]=="O")
  end

  def valid_move?(index)
    (index.between?(0, 9) && !position_taken?(index))
  end

  def turn_count
    @board.count{|token|(token=="X"||token=="O")}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter a number 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      piece_1 = @board[combo[0]]
      piece_2 = @board[combo[1]]
      piece_3 = @board[combo[2]]

      ((piece_1==piece_2)&&(piece_2==piece_3)&&(position_taken?(combo[1]))) ? combo : false
    end
end
