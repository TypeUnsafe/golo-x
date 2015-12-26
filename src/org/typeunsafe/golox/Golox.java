package org.typeunsafe.golox;

import io.vertx.core.Vertx;
import io.vertx.core.http.HttpServer;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.handler.BodyHandler;
import io.vertx.ext.web.handler.StaticHandler;

/**
 * Created by k33g_org on 26/12/15.
 */
public class Golox {

    static Vertx vertx = Vertx.vertx();

    public Golox() {
        System.out.println("Welcome to Golo-X");
    }

    public HttpServer createHttpServer() {
        return Golox.vertx.createHttpServer();
    }

    public Router getRouter() {
        Router router = Router.router(Golox.vertx);
        router.route().handler(BodyHandler.create());
        return router;
    }
    public HttpServer startHttpServer(HttpServer server, Router router, Integer port, String staticPath) {
        System.out.println("HttpServer is listening on " + port);
        router.route(staticPath).handler(StaticHandler.create());
        server.requestHandler(router::accept).listen(port);
        return server;
    }


}
