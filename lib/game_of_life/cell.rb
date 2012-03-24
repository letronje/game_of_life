module GameOfLife
  class Cell
    
    def self.dead
      self.new(false)
    end

    def self.alive
      self.new(true)
    end

    def initialize(alive)
      @alive = alive
    end

    def alive?
      @alive
    end

    def dead?
      not alive?
    end

    def next(env, rules)
      num_dead = env.dead_count
      num_alive = env.alive_count

      #find first rule that matches
      next_state = nil
      rules.find do |rule|
        next_state = rule.match(self, num_alive, num_dead)
        !next_state.nil?
      end

      Cell.new(next_state.nil? ? alive? : next_state)
    end

    def to_s
      alive? ? "X" : "-"
    end
  end
end
