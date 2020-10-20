//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public extension NotificationCenter {
    func addObserver<Notification>(notification: Notification,
                                   object: Any?,
                                   queue: OperationQueue? = nil,
                                   using block: @escaping (Notification.Payload) -> Void)
        -> NotificationObservation where Notification: TypeSafeNotification {
        let token = addObserver(forName: notification.name, object: object, queue: queue) {
            block(notification.decode($0))
        }
        return NotificationObservation(token: token, center: self)
    }
}

public final class NotificationObservation {
    let token: NSObjectProtocol
    let center: NotificationCenter

    init(token: NSObjectProtocol, center: NotificationCenter) {
        self.token = token
        self.center = center
    }

    deinit {
        center.removeObserver(token)
    }
}
