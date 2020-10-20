//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import UIKit

protocol TypeSafeKeyboardNotification: TypeSafeNotification where Payload == (begin: CGRect, end: CGRect, duration: TimeInterval) {}

extension TypeSafeKeyboardNotification {
    func decode(_ notification: Notification) -> Payload {
        let begin = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        let end = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        return (begin, end, duration)
    }
}

struct KeyboardWillShowNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardWillShowNotification
}

struct KeyboardDidShowNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardDidShowNotification
}

struct KeyboardWillHideNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardWillHideNotification
}

struct KeyboardDidHideNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardDidHideNotification
}

struct KeyboardWillChangeFrameNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardWillChangeFrameNotification
}

struct KeyboardDidChangeFrameNotification: TypeSafeKeyboardNotification {
    let name = UIResponder.keyboardDidChangeFrameNotification
}
