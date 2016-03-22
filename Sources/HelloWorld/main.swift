import Kitura
import KituraNet
import KituraSys

let router = Router()

router.get("/v1/health") {
request, response, next in
    let healthHandler = HealthHandler(request: request, response: response)
    healthHandler.handle()

    next()
}

let server = HttpServer.listen(8090, delegate: router)
Server.run()
