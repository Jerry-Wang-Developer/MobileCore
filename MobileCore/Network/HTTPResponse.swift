//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public struct HTTPResponse<Body> {
    /// HTTP Status Code
    public let code: Int

    /// The response's body
    public let body: Body

    /// The response's headers
    public let headers: [String: String]

    init(code: Int,
         body: Body,
         headers: [String: String] = [:]) {
        self.code = code
        self.body = body
        self.headers = headers
    }
}
