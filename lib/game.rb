class Game
  attr_reader :current_player # rspec testing purpose

  def initialize(player_x, player_o)
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
    @winner = nil
    @win_direction = nil
  end

  def play(board)
    result = nil
    str = ""

    until result == :draw
      str_default = "#{@current_player.name} (#{@current_player.coin}), please select column (A-G): "

      puts "\n" + board.display
      print str == "" ? str_default : str
      column = gets.chomp
      str = ""

      break if column == 'exit'

      result = board.put_coin(column, @current_player.coin)

      case result
      when :invalid
        str = "Invalid column - please select a valid column (A-G): "
      when :not_available
        str = "Column not available - please select a different column (A-G): "
      when :horizontal, :vertical, :diagonal
        @winner = @current_player
        @win_direction = result
        break
      else
        next_turn
      end
    end

    if column != 'exit'
      puts "\n" + board.display
      str =
        if @winner.nil?
          "The game was a tie.\n\n"
        else
          "#{@winner.name} has won the game because of the #{@win_direction} row of #{@winner.coin}'s.\n\n"
        end
      puts str
    end
  end

  def next_turn
    @current_player =
      if @current_player == @player_x
        @player_o
      else
        @player_x
      end
  end
end
