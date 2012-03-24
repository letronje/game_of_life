module GameOfLife
  class CellEnvironment
    offsets = [-1, 0, 1]
    
    #cartesian product
    @@neighbors_offsets = offsets.product(offsets) - [[0, 0]]
    
    def initialize(cell_coords, cells, universe_dimensions)
      universe_width, universe_height = universe_dimensions
      
      cell_r, cell_c = cell_coords

      @neighbors = @@neighbors_offsets.map { |dx, dy|
        neighbor_r = (cell_r + dx) % universe_height
        neighbor_c = (cell_c + dy) % universe_width
        cells[neighbor_r][neighbor_c]
      }
    end

    def dead_count
      @dead_count ||= @neighbors.size - alive_count
    end
    
    def alive_count
      @alive_count ||= @neighbors.select(&:alive?).size 
    end
  end
end
