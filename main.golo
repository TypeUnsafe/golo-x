module try_vertx

import org.typeunsafe.golox.Golox
import web.extensions
import tools

function main = |args| {

  every(4): seconds(): run({
    println("---> Yo!")
  })

  let server = Golox.createHttpServer()
  let router = Golox.getRouter()

  # http://localhost:9090/hello
  router: get("/hello"): handler(|context| {
    let response = context: response()
    response: putHeader("content-type", "text/plain")
    response: end("Hello World from Golo.x-Web!")
  })

  # http://localhost:9090/hi
  router: get("/hi"): handler(|context| {
    let response = context: response()
    response: putHeader("content-type", "application/json")
    response: end(JSON.stringify(map[["message","Hello World from Golo.x-Web!"]]))
  })

  # pimp my router
  # http://localhost:9090/yo
  router: get("/yo", |context| {
    let response = context: response()
    response: putHeader("content-type", "text/html")
    response: end("Yo from Golo.x-Web!")
  })

  # pimp RoutingContext
  # http://localhost:9090/salut
  router: get("/salut", |context| {
    context: sendJson(DynamicObject(): message("Salut à tous!"))
  })

  Golox.startHttpServer(server, router, 9090, "/*")

}
