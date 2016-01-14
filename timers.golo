module timers

import vert.x.helpers

function main = |args| {

  # each 1000 ms
  let t1 = vertx(): setPeriodic(1000_L, |id| {
    println("Hi!" + id)
  })

  vertx(): setPeriodic(2000_L, |id| {
    println("Yo!" + id)
  })

  # after 5000 ms
  vertx(): setTimer(5000_L, |id| {
    println("Hello!" + id)
    vertx(): cancelTimer(0_L)
    vertx(): cancelTimer(1_L)
  })






}
