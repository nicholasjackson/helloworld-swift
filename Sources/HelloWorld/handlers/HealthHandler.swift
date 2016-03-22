import Kitura
import KituraNet
import SwiftyJSON
import Foundation

#if os(OSX)
    typealias JSONDictionary = [String: AnyObject]
#else
    typealias JSONDictionary = [String: Any]
#endif

public class HealthHandler {

  private let request: RouterRequest
  private let response: RouterResponse

  public init(request: RouterRequest, response: RouterResponse) {
    self.request = request
    self.response = response
  }

  public func handle() -> Void {
    let result: JSONDictionary = ["status_message": "OK"]
    response.status(HttpStatusCode.OK).sendJson(JSON(result))
  }

}
