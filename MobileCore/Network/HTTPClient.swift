//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Combine
import Foundation

protocol HTTPClient {
    func send<Request>(_ request: Request)
        -> AnyPublisher<HTTPResponse, Error> where Request: URLRequestConvertible
}

extension HTTPClient {
    func send<Request, Serializer, Response>(_ request: Request,
                                             serializer: Serializer)
        -> AnyPublisher<Response, Error> where
        Request: URLRequestConvertible,
        Serializer: Serializer,
        Serializer.Output == Response {
        send(request).tryMap(serializer.serialize(response:)).eraseToAnyPublisher()
    }
}
