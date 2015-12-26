module web.extensions

augment io.vertx.ext.web.Router {
  function get = |this, uri, handler| {
    return this: get(uri): handler(handler)
  }
  function post = |this, uri, handler| {
    return this: post(uri): handler(handler)
  }
}

augment io.vertx.ext.web.RoutingContext {
  function param = |this, paramName| -> this: request(): getParam(paramName)

  function sendJson = |this, content| ->
    this: response()
      : putHeader("content-type", "application/json;charset=UTF-8")
      : end(JSON.stringify(content))

  function sendHtml = |this, content| ->
    this: response()
      : putHeader("content-type", "text/html;charset=UTF-8")
      : end(content)

  function sendText = |this, content| ->
    this: response()
      : putHeader("content-type", "text/plain;charset=UTF-8")
      : end(content)

  function bodyAsJson = |this| ->
    JSON.parse(this: getBodyAsString())
}
