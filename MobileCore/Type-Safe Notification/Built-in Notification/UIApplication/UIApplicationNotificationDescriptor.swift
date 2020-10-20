//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import UIKit

struct UIApplicationDidEnterBackgroundNotification: EmptyPayloadNotification {
    let name = UIApplication.didEnterBackgroundNotification
}

struct UIApplicationWillEnterBackgroundNotification: EmptyPayloadNotification {
    let name = UIApplication.willEnterForegroundNotification
}

struct UIApplicationDidFinishLaunchingNotification: EmptyPayloadNotification {
    let name = UIApplication.didFinishLaunchingNotification
}

struct UIApplicationDidBecomeActiveNotification: EmptyPayloadNotification {
    let name = UIApplication.didBecomeActiveNotification
}

struct UIApplicationWillResignActiveNotification: EmptyPayloadNotification {
    let name = UIApplication.willResignActiveNotification
}

struct UIApplicationDidReceiveMemoryWarningNotification: EmptyPayloadNotification {
    let name = UIApplication.didReceiveMemoryWarningNotification
}

struct UIApplicationWillTerminateNotification: EmptyPayloadNotification {
    let name = UIApplication.willTerminateNotification
}
