//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public protocol EmptyPayloadNotification: TypeSafeNotification where Payload == Void {}

public extension EmptyPayloadNotification {
    func decode(_: Notification) -> Payload {
        ()
    }
}
