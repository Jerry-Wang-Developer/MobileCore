//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public protocol TypeSafeNotification {
    associatedtype Payload
    var name: Notification.Name { get }
    func encode(payload: Payload, object: Any?) -> Notification
    func decode(_ notification: Notification) -> Payload
}

public extension TypeSafeNotification {
    private var payloadKey: String {
        "PayloadKey"
    }

    func encode(payload: Payload, object: Any? = nil) -> Notification {
        let info = [payloadKey: payload]
        let notification = Notification(name: name, object: object, userInfo: info)
        return notification
    }

    func decode(_ notification: Notification) -> Payload {
        if let payload = notification.userInfo?[payloadKey] as? Payload {
            return payload
        } else {
            fatalError("Can not find \(payloadKey) in notification's(\(name)) userInfo")
        }
    }
}
