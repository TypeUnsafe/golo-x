module web.extensions

augment io.vertx.ext.web.Router {
  function get = |this, uri, handler| {
    return this: get(uri): handler(handler)
  }
}
