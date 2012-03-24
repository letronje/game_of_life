puts "#"*100
u = Universe.from([ "XX",
                    "XX"
                  ])
u.print
u.next.print

puts "#"*100
u = Universe.from([ "XX-",
                    "X-X",
                    "-X-"
                  ])
u.print
u.next.print

puts "#"*100
u = Universe.from([ "-X-",
                    "-X-",
                    "-X-"
                  ])

u.print
u.next.print
u.next.next.print


puts "#"*100
u = Universe.from([ "-XXX",
                    "XXX-" ])
u.print
u.next.print

puts "#"*100
u = Universe.from([ "-XX-",
                    "X--X",
                    "-XX-"
                  ])
u.print
u.next.print

puts "#"*100
u = Universe.from([ "-XX-",
                    "X--X",
                    "-X-X",
                    "--X-"
                  ])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "XX-",
                    "X-X",
                    "-X-",
                  ])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "-XXX",
                    "XXX-",
                  ])

u.print
u.next.print
u.next.next.print

puts "#"*100
u = Universe.from([ "X",
                    "X",
                    "X"
                  ])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "XX--",
                    "X---",
                    "---X",
                    "--XX"
                  ])

u.print
u.next.print
u.next.next.print


puts "#"*100
u = Universe.from([])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "X"])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "XX"])

u.print
u.next.print


puts "#"*100
u = Universe.from([ "X",
                    "X"
                  ])

u.print
u.next.print

puts "#"*100
u = Universe.from([ "-X-",
                    "--X",
                    "XXX"
                  ])

u.print

10.times do
  u = u.next
  u.print
end

