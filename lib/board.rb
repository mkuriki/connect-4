class Board
  attr_accessor :grid
  attr_accessor :empty_spaces # rspec testing purpose

  def initialize
    @grid = Array.new(6) { Array.new(7, ' ') }
    @row_max = @grid.size-1
    @col_max = @grid[0].size-1
    @empty_spaces =  @grid.size * @grid[0].size
  end

  VALID_COLUMN = ['A','B','C','D','E','F','G']

  def display
    str = ''
    str += grid.map { |row| '|' + row.join('') + "|\n" }.join('')
    str += ' ABCDEFG '
    str
  end

  private def valid?(column)
    VALID_COLUMN.include?(column.upcase)
  end

  private def available?(column)
    column_index = VALID_COLUMN.index(column.upcase)
    row_index = grid.rindex { |row| row[column_index] == ' ' }
    if !row_index.nil?
      [row_index, column_index]
    else
      false
    end
  end

  def put_coin(column, coin)
    result = nil
    if valid?(column)
      location = available?(column)
      if location
        @grid[location[0]][location[1]] = coin
        @empty_spaces -= 1
        # returned values - :horizontal, :vertical, :diagonal, or :none
        result = connection_found?(location[0],location[1])
        if result == :none && @empty_spaces == 0 # @coin_count == @full
          result = :draw
        end
      else
        result = :not_available
      end
    else
      result = :invalid
    end
    result
  end

  private def connection_found?(drop_row, drop_col)
    if check_connection(drop_row, drop_col-3, 0, 1)
      :horizontal
    elsif check_connection(drop_row-3, drop_col, 1, 0)
      :vertical
    elsif check_connection(drop_row+3, drop_col+3, -1, -1)
      :diagonal
    elsif check_connection(drop_row+3, drop_col-3, -1, 1)
      :diagonal
    else
      :none
    end
  end

  private def check_connection(row, col, row_increment, col_increment)
    coin = nil
    count = 0

    7.times do
      if (0..@row_max).include?(row) && (0..@col_max).include?(col)
        if coin.nil?
          coin = @grid[row][col]
        end
        if coin == @grid[row][col]
          count += 1
          if count == 4 && coin != ' '
            return true
          end
        else
          coin = @grid[row][col]
          count = 1
        end
      end
      row += row_increment
      col += col_increment
    end
    false
  end
end
