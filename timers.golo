module timers

import tools

function main = |args| {

  let timer1 = every(2): seconds(): run(-> println("Yo!"))

  let timer2 = every(1000): milliSeconds(): run({
    println("Hi!")
  })

  let endTimer = after(4): seconds(): run({
    timer1: cancel()
    timer2: cancel()
  })

}
