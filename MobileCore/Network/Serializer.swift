//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

protocol Serializer {
    associatedtype Output
    func serialize(data: Data) throws -> Output
}

struct DecodableSerializer<T>: Serializer where T: Decodable {
    typealias Output = T
    func serialize(data: Data) throws -> Output {
        try decoder.decode(Output.self, from: data)
    }

    private let decoder: AnyDecoder
    init(decoder: AnyDecoder) {
        self.decoder = decoder
    }
}
