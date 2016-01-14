module web.extensions

augment io.vertx.ext.web.Router {
  function get = |this, uri, handler| {
    return this: get(uri): handler(handler)
  }
  function post = |this, uri, handler| {
    return this: post(uri): handler(handler)
  }
  #TODO: put, delete
}


augment io.vertx.core.http.HttpServerResponse {
  function json = |this, content| ->
    this: putHeader("content-type", "application/json;charset=UTF-8")
        : end(JSON.stringify(content))

  function html = |this, content| ->
    this: putHeader("content-type", "text/html;charset=UTF-8")
        : end(content)

  function text = |this, content| ->
    this: putHeader("content-type", "text/plain;charset=UTF-8")
        : end(content)
}

augment io.vertx.core.http.HttpServerRequest {
  function param = |this, paramName| -> this: getParam(paramName)
}

augment io.vertx.ext.web.RoutingContext {

  function bodyAsJson = |this| ->
    JSON.parse(this: getBodyAsString())
}
