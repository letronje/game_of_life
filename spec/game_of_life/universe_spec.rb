require 'spec_helper'

module GameOfLife

  describe Universe do

    before(:each) do
      @out = double('out').as_null_object
    end

    describe "still life" do
      it 'block' do
        ip = [
              "XX",
              "XX"
             ]
        
        op = ip.join("\n")
        
        @out.should_receive(:puts).with(op).once
        Universe.from(ip).next.print(@out)
      
      end

      it 'beehive' do
        ip = [
              "-XX-",
              "X--X",
              "-XX-"
             ]
        
        op = ip.join("\n")
        
        @out.should_receive(:puts).with(op).once
        Universe.from(ip).next.print(@out)
      end

      it 'loaf' do
        ip = [
              "-XX-",
              "X--X",
              "-X-X",
              "--X-"
             ]
        
        op = ip.join("\n")
        
        @out.should_receive(:puts).with(op).once
        Universe.from(ip).next.print(@out)
      end

      it 'boat' do
        ip = [
              "XX-",
              "X-X",
              "-X-"
             ]
        op = ip.join("\n")
        
        @out.should_receive(:puts).with(op).once
        Universe.from(ip).next.print(@out)
      end
    end

    describe "oscillators" do
      it 'blinker' do
        ip = [
              "XXX"
             ]
        
        op1 =  [
                "X",
                "X",
                "X"
               ] .join("\n")
        
        op2 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
      end

      it 'toad' do
        ip =  [
               "-XXX",
               "XXX-"
              ]
        
        op1 = [
               "--X-",
               "X--X",
               "X--X",
               "-X--"
              ].join("\n")
        
        op2 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
      end

      it 'beacon' do
        ip = [
              "XX--",
              "X---",
              "---X",
              "--XX"
             ]
        
        op1 =  [
                "XX--",
                "XX--",
                "--XX",
                "--XX"
               ].join("\n")
        
        op2 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
      end

      it 'pulsar' do
        ip = [
              "----X-----X----",
              "----X-----X----",
              "----XX---XX----",
              "---------------",
              "XXX--XX-XX--XXX",
              "--X-X-X-X-X-X--",
              "----XX---XX----",
              "---------------",
              "----XX---XX----",
              "--X-X-X-X-X-X--",
              "XXX--XX-XX--XXX",
              "---------------",
              "----XX---XX----",
              "----X-----X----",
              "----X-----X----",
             ]
        
        op1 = [
               "--XX-----XX--",
               "---XX---XX---",
               "X--X-X-X-X--X",
               "XXX-XX-XX-XXX",
               "-X-X-X-X-X-X-",
               "--XXX---XXX--",
               "-------------",
               "--XXX---XXX--",
               "-X-X-X-X-X-X-",
               "XXX-XX-XX-XXX",
               "X--X-X-X-X--X",
               "---XX---XX---",
               "--XX-----XX--"
               
              ].join("\n")
        
        op2 = [
               "--XXX---XXX--",
               "-------------",
               "X----X-X----X",
               "X----X-X----X",
               "X----X-X----X",
               "--XXX---XXX--",
               "-------------",
               "--XXX---XXX--",
               "X----X-X----X",
               "X----X-X----X",
               "X----X-X----X",
               "-------------",
               "--XXX---XXX--"
              ].join("\n")
        
        op3 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        @out.should_receive(:puts).with(op3)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
        u.next.next.print(@out)
      end
    end

    describe "spaceships" do
      it "glider" do
        ip = [
              "-X-",
              "--X",
              "XXX"
             ]
        
        op1 = [
               "X-X",
               "-XX",
               "-X-"
              ].join("\n")

        op2 = [
               "--X",
               "X-X",
               "-XX"
              ].join("\n")

        op3 =  [
                "X--",
                "-XX",
                "XX-"
               ].join("\n")

        op4 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        @out.should_receive(:puts).with(op3)
        @out.should_receive(:puts).with(op4)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
        u.next.next.print(@out)
        u.next.next.next.print(@out)
      end

      it 'light weight space ship' do
        ip = [
              "X--X-",
              "----X",
              "X---X",
              "-XXXX"
             ]
        
        op1 = [
               "--XX-",
               "XX-XX",
               "XXXX-",
               "-XX--"
              ].join("\n")

        op2 = [
               "-XXXX",
               "X---X",
               "----X",
               "X--X-"
              ].join("\n")

        op3 = [
               "-XX--",
               "XXXX-",
               "XX-XX",
               "--XX-"
              ].join("\n")

        op4 = ip.join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        @out.should_receive(:puts).with(op3)
        @out.should_receive(:puts).with(op4)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
        u.next.next.print(@out)
        u.next.next.next.print(@out)
      end
    end

    describe "misc" do
      it 'cross, 5 steps' do
        ip =  [
               "-X-",
               "XXX",
               "-X-"
              ]
        
        op1 = [
               "XXX",
               "X-X",
               "XXX"
              ].join("\n")
        
        op2 = [
               "--X--",
               "-X-X-",
               "X---X",
               "-X-X-",
               "--X--"
              ].join("\n")
        
        op3 = [
               "--X--",
               "-XXX-",
               "XX-XX",
               "-XXX-",
               "--X--"
              ].join("\n")

        op4 = [
               "-XXX-",
               "X---X",
               "X---X",
               "X---X",
               "-XXX-"
              ].join("\n")

        op5 = [
               "---X---",
               "--XXX--",
               "-X-X-X-",
               "XXX-XXX",
               "-X-X-X-",
               "--XXX--",
               "---X---",
              ].join("\n")
        
        @out.should_receive(:puts).with(op1)
        @out.should_receive(:puts).with(op2)
        @out.should_receive(:puts).with(op3)
        @out.should_receive(:puts).with(op4)
        @out.should_receive(:puts).with(op5)
        
        u = Universe.from(ip).next
        u.print(@out)
        u.next.print(@out)
        u.next.next.print(@out)
        u.next.next.next.print(@out)
        u.next.next.next.next.print(@out)
      end
    end
  end
end
