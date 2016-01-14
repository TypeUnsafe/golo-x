module try_vertx

import vert.x.helpers
import web.extensions

import gololang.Errors

@option
function divide = |a,b| {
  return a/b
}
@result
function toInt = |sParam| {
  return java.lang.Integer.parseInt(sParam: trim())
}

function main = |args| {

  let server = createHttpServer()
  let router = getRouter()

  router: get("/divide/:a/:b", |context| {
    let a = toInt(context: request(): param("a")): orElseGet(-> 1)
    let b = toInt(context: request(): param("b")): orElseGet(-> 1)

    let res = divide(a,b): either(
      |value| -> value, -> 1
    )
    context: response(): json(DynamicObject()
      : a(a)
      : b(b)
      : result(res)
    )
  })

  startHttpServer(
    server=server,
    router=router,
    port=9090,
    staticPath="/*"
  )

}
