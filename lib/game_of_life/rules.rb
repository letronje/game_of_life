module GameOfLife
  module Rules
    class DeathByLoneliness
      def self.match(cell, env_alive_count, env_dead_count)
        false if cell.alive? && env_alive_count < 2
      end
    end

    class DeathByOvercrowding
      def self.match(cell, env_alive_count, env_dead_count)
        false if cell.alive? && env_alive_count > 3
      end
    end

    class Survival
      def self.match(cell, env_alive_count, env_dead_count)
        true if cell.alive? && [2, 3].include?(env_alive_count)
      end
    end

    class Resurrection
      def self.match(cell, env_alive_count, env_dead_count)
        true if cell.dead? && env_alive_count == 3
      end
    end
  end
end
