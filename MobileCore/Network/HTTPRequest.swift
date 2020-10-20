//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

struct HTTPRequest {
    let method: HTTPMethod
    let path: String
}
