module tools

#wip
import org.typeunsafe.golox.Golox

struct every = {
  delay
}

struct after = {
  delay
}

struct timer = {
  id
}

augmentation time  = {
  function seconds = |this| {
    this: delay(this: delay() * 1000_L)
    return this
  }
  function milliSeconds = |this, delay| {
    this: delay(this: delay() * 1_L)
    return this
  }
}

augment every with time
augment after with time

augment timer {
  function cancel = |this| -> Golox.vertx.cancelTimer(this: id())
}

augment every {
  function run = |this, closure| -> timer(Golox.every(this: delay(), closure))
}

augment after {
  function run = |this, closure| -> timer(Golox.after(this: delay(), closure))
}
