//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public struct HTTPResponseBody {
    public var content: Data
    public var type: HTTPContentType?

    public init(content: Data, type: HTTPResponseType) {
        self.content = content
        self.type = type
    }
}
