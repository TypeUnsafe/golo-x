module try_vertx

import org.typeunsafe.golox.Golox

function main = |args| {

  let golox = Golox()
  let server = golox: createHttpServer()
  let router = golox: getRouter()

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

  golox: startHttpServer(server, router, 9090, "/*")

}
