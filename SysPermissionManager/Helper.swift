//
//  Helper.swift
//  SysPermissionTest
//
//  Created by Blaer on 2018/7/30.
//  Copyright © 2018 curusblaer. All rights reserved.
//

import Foundation

enum PermissionType {
    case photo
    case camera
    case media
    case microphone
    case location
    case bluetooth
    case pushNotification
    case speech
    case event
    case contact
    case reminder
}

enum AuthorizationStatus {
    case authorized
    case denied
    case notDetermined
    case restricted
    case locationAlways
    case locationWhenInUse
    case unknown
}
