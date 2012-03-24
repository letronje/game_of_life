require_relative '../universe'

module GameOfLife
  module UI
    class CommandLine
      def get_new_state

        puts "\nEnter a new state(press 'enter' twice to end): "
        state = []
        
        loop do
          line = gets
          
          next if line.nil?
          line.chomp!
          next if line.empty?

          state = [line]
          
          loop do
            line = gets
            break if line.nil?
            line.chomp!
            break if line.empty?
            state << line
          end

          return state
        end
      end
      
      def run
        cmd = 'n'
        u = nil
        
        loop do
          unless cmd
            print "\nEnter 'c' to goto next state, 'n' to start afresh, 'q' to quit : "
            cmd = gets
            next if cmd.nil?
            cmd.chomp!
            if cmd.empty?
              cmd = nil
              next
            end
          end
          
          case cmd
          when 'q'
            exit
          when 'c'
          when 'n'
            s = get_new_state
            u = Universe.from(s)
          else
            puts "\n\nInvalid option\n\n"
            cmd = nil
            next
          end

          u = u.next
          puts "\nNext state : \n\n"
          u.print

          cmd = nil
        end
      end
    end
  end
end
