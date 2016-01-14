module vert.x.helpers

import io.vertx.core.Vertx
import io.vertx.core.http.HttpServer
import io.vertx.ext.web.Router
import io.vertx.ext.web.handler

let _vertx = Vertx.vertx()

function vertx = -> _vertx

function createHttpServer = {
  return _vertx: createHttpServer()
}

function getRouter = {
  let router = Router.router(_vertx)
  router: route(): handler(BodyHandler.create())
  return router
}

function startHttpServer = |server, router, port, staticPath| {
  router: route(staticPath): handler(StaticHandler.create())
  server: requestHandler(|httpRequest| -> router: accept(httpRequest)): listen(port)
  println("HttpServer is listening on " + port)
  return server
}
