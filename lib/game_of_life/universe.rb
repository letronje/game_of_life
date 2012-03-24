require_relative 'rules'
require_relative 'cell'
require_relative 'cell_environment'

module GameOfLife
  class Universe
    @@rules = Rules.constants.map{|class_name| Rules.const_get(class_name)}

    def self.from(pattern)
      self.new(pattern.map { |row|
                 row.each_char.map { |c|
                   Cell.new(c == 'X')
                 }
               })
    end
    
    def initialize(cells)
      @dimensions = cells.empty? ? [0, 0] : [cells.first.size, cells.size]
      @cells = cells
    end

    #returns a new universe with the next state
    def next
      inflated_dimensions = @dimensions.map{ |d| d+2 }
      inflated_width, inflated_height = inflated_dimensions

      #inflate first to accomodate possible growth
      cells = inflate(@cells, inflated_width)

      new_cells = cells.each_with_index.map do |row, r|
        row.each_with_index.map do |cell, c|
          env = CellEnvironment.new([r, c],
                                    cells,
                                    inflated_dimensions)
          cell.next(env, @@rules)
        end
      end

      #deflate if required
      self.class.new(deflate(new_cells, inflated_dimensions))
    end

    def print(out=STDOUT)
      print_cells(@cells, out)
    end

    private

    def print_cells(cells, out=STDOUT)
      out.puts cells.map { |row|
        row.map { |c| c.alive? ? "X" : "-"}.join
      }.join("\n")
    end
    
    def inflate(cells, to_width)
      top, bottom = 2.times.map { to_width.times.map { Cell.dead } }
      middle = cells.map { |row| [ Cell.dead, *row, Cell.dead ] }
      [top, *middle, bottom]
    end
    
    def deflate(cells, inflated_dimensions)
      inflated_width, inflated_height = inflated_dimensions

      row_max = inflated_height - 1
      col_max = inflated_width - 1

      #deflate top and bottom
      r1 = cells.find_index { |row| row.any?(&:alive?) } || (row_max+1)
      r2 = row_max - (cells.reverse.find_index { |row| row.any?(&:alive?) } || (row_max+1))

      trimmed_cells = (r1 > 0 || r2 < row_max) ? cells[r1..r2] : cells

      #deflate left and right
      transposed = trimmed_cells.transpose

      c1 = transposed.find_index { |row| row.any?(&:alive?) } || (col_max+1)
      c2 = col_max - (transposed.reverse.find_index { |row| row.any?(&:alive?) } || (col_max+1))

      (c1 > 0 || c2 < col_max) ? trimmed_cells.map { |row| row[c1..c2] } : trimmed_cells
    end
  end
end
