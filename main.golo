module try_vertx

import vert.x.helpers
import web.extensions

function main = |args| {

  let server = createHttpServer()
  let router = getRouter()

  # with augmentations
  router: get("/yo", |context| ->
    context: response(): json(DynamicObject(): message("yo!"))
  )

  router: get("/yo/:id", |context| ->
    context: response(): json(
      DynamicObject()
        : message("yo!")
        : id(context: request(): param("id"))
    )
  )

  # without augmentation
  router: get("/hello"): handler(|context| {
    let response = context: response()
    response: putHeader("content-type", "text/plain")
    response: end("Hello World from Golo.x-Web!")
  })

  router: get("/hi"): handler(|context| {
    let response = context: response()
    response: putHeader("content-type", "application/json")
    response: end(JSON.stringify(map[
      ["message","Hello World from Golo.x-Web!"]
    ]))
  })



  startHttpServer(
    server=server,
    router=router,
    port=9090,
    staticPath="/*"
  )

}
