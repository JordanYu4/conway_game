require_relative 'cell'

class Grid 

  attr_accessor :grid

  DELTAS = [
    [-1, 1],
    [0, 1], 
    [1, 1], 
    [1, 0], 
    [1, -1], 
    [0, -1], 
    [-1, -1], 
    [-1, 0]
  ]

  def initialize(size = 21)
    # print "grid size param: " + size.to_s
    @size = size
    @grid = Array.new(size) { Array.new(size) { Cell.new } }
    self.seed
    self.step
  end

  def seed
    @grid.each do |row| 
      row.each do |cell|
        # new_cell = Cell.new
        # @grid[row_idx][col_idx] = new_cell
        put_up = rand(100) 
        cell.animate if put_up < 50
      end
    end
  end

  def step
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        count = 0
        DELTAS.each do |delta|
          neighbor_row, neighbor_col = row_idx + delta[0], col_idx + delta[1]
          next unless neighbor_row.between?(0, @size-1) 
          next unless neighbor_col.between?(0, @size-1)
          # print("#{neighbor_col}, #{neighbor_row} \n")
          neighbor = @grid[neighbor_row][neighbor_col]
          # print neighbor.object_id
          # print(" " + neighbor.active?.to_s)
          # print("\n")
          if neighbor.active?
            count += 1
          end
        end
        # print("row: #{row.object_id} ")
        # print("cell: #{cell.object_id}")
        # print("-------")
        # print("\n")
        # print count
        # print("\n")
        if count < 2 
          cell.sleep 
        elsif count < 4 
          cell.animate unless cell.active? 
        else
          cell.sleep 
        end
      end
    end
  end

  def render 
    divider = '--' * @size
    print(divider)
    print("\n")
    @grid.each do |row| 
      row.each do |cell| 
        if cell.active? 
          print('x ')
        else 
          print('o ')
        end
      end
      print("\n")
    end
    print(divider)
  end

  ##############

  # private

  # def [](pos)
  #   @grid[y][x]
  # end

  # def []=(pos, val)
  #   @grid[pos[0]][pos[1]] = val
  # end
  
end