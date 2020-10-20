//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public protocol AnyDecoder: AnyObject {
    var userInfo: [CodingUserInfoKey: Any] { get set }
    func decode<T>(_ value: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: AnyDecoder {}
extension PropertyListDecoder: AnyDecoder {}
