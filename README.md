#Golo-X

A jar file with Vert-x dependencies to pimp Vert-x with [Golo](http://golo-lang.org/).

##Build jar

    ./build.sh

##Run

    ./golox.sh

##Web Sample

```golo
module try_vertx

import vert.x.helpers
import web.extensions

function main = |args| {

  let server = createHttpServer()
  let router = getRouter()

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

  startHttpServer(
    server=server,
    router=router,
    port=9090,
    staticPath="/*"
  )

}
```
