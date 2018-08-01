//
//  PrivacyPermission.swift
//  SysPermissionTest
//
//  Created by Blaer on 2018/8/1.
//  Copyright © 2018 curusblaer. All rights reserved.
//

import Photos
import AVFoundation
import EventKit
import Contacts
import Speech
import MediaPlayer
import UserNotifications
import CoreBluetooth
import CoreLocation

class PrivacyPermission: NSObject {
    
    static let PrivacyPermissionTypeLocationDistanceFilter = 10.0
    
    static let instance: PrivacyPermission = PrivacyPermission()
    
    class func shared() -> PrivacyPermission {
        return instance
    }
    
    class func accessPermission(with type: PermissionType, completion:@escaping (Bool, AuthorizationStatus)->()) -> Void {
        
        switch type {
        case .photo:
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .denied {
                    completion(false, .denied)
                } else if status == .notDetermined {
                    completion(false, .notDetermined)
                } else if status == .restricted {
                    completion(false, .restricted)
                } else if status == .authorized {
                    completion(true, .authorized)
                }
            }
            break
            
        case .camera:
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                let status = AVCaptureDevice.authorizationStatus(for: .video)
                if granted {
                    completion(true, .authorized)
                } else {
                    if status == .denied {
                        completion(false, .denied)
                    } else if status == .notDetermined {
                        completion(false, .notDetermined)
                    } else if status == .restricted {
                        completion(false, .restricted)
                    }
                }
            }
            break
            
        case .media:
            if #available(iOS 9.3, *) {
                MPMediaLibrary.requestAuthorization { (status) in
                    if status == .denied {
                        completion(false, .denied)
                    } else if status == .notDetermined {
                        completion(false, .notDetermined)
                    } else if status == .restricted {
                        completion(false, .restricted)
                    } else if status == .authorized {
                        completion(true, .authorized)
                    }
                }
            } else {
                // Fallback on earlier versions
            }
            break
            
        case .microphone:
            AVCaptureDevice.requestAccess(for: .audio) { (granted) in
                let status = AVCaptureDevice.authorizationStatus(for: .audio)
                if granted {
                    completion(true, .authorized)
                } else {
                    if status == .denied {
                        completion(false, .denied)
                    } else if status == .notDetermined {
                        completion(false, .notDetermined)
                    } else if status == .restricted {
                        completion(false, .restricted)
                    }
                }
            }
            break
            
        case .location:
            if CLLocationManager.locationServicesEnabled(){
                let locationManager = CLLocationManager()
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                locationManager.distanceFilter = PrivacyPermissionTypeLocationDistanceFilter
                locationManager.startUpdatingLocation()
            }
            let status = CLLocationManager.authorizationStatus()
            if status == .authorizedAlways {
                completion(true, .locationAlways)
            } else if status == .denied {
                completion(false, .denied)
            } else if status == .notDetermined {
                completion(false, .notDetermined)
            } else if status == .restricted {
                completion(false, .restricted)
            }
            break
            
        case .bluetooth:
            let centralManager = CBCentralManager()
            let state = centralManager.state
            if state == .unsupported || state == .unauthorized || state == .unknown {
                completion(false, .denied)
            } else {
                completion(true, .authorized)
            }
            break
        case .pushNotification:
            if #available(iOS 10.0, *) {
                let center = UNUserNotificationCenter.current()
                let types: UNAuthorizationOptions = [.badge, .alert, .sound]
                center.requestAuthorization(options: types) { (granted, error) in
                    if granted {
                        center.getNotificationSettings(completionHandler: { (settings) in
                            //
                        })
                    }else {
                        UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [UIApplicationOpenURLOptionUniversalLinksOnly: ""], completionHandler: { (success) in
                            
                        })
                    }
                }
            } else {
                // Fallback on earlier versions
                UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil))
            }
            
            break
        case .speech:
            if #available(iOS 10.0, *) {
                SFSpeechRecognizer.requestAuthorization { (status) in
                    if status == .denied {
                        completion(false, .denied)
                    } else if status == .restricted {
                        completion(false, .restricted)
                    } else if status == .authorized {
                        completion(true, .authorized)
                    }
                }
            } else {
                // Fallback on earlier versions
            }
            break
        case .event:
            let store = EKEventStore()
            store.requestAccess(to: .event) { (granted, error) in
                let status = EKEventStore.authorizationStatus(for: .event)
                if granted {
                    completion(true, .authorized)
                } else if status == .notDetermined {
                    completion(false, .notDetermined)
                } else if status == .restricted {
                    completion(false, .restricted)
                }
            }
            break
        case .contact:
            let contactStore = CNContactStore()
            contactStore.requestAccess(for: .contacts) { (granted, error) in
                let status = CNContactStore.authorizationStatus(for: .contacts)
                if granted {
                    completion(true, .authorized)
                } else {
                    if status == .denied {
                        completion(false, .denied)
                    } else if status == .notDetermined {
                        completion(false, .notDetermined)
                    } else if status == .restricted {
                        completion(false, .restricted)
                    }
                }
            }
            break
        case .reminder:
            let store = EKEventStore()
            store.requestAccess(to: .reminder) { (granted, error) in
                let status = EKEventStore.authorizationStatus(for: .reminder)
                if granted {
                    completion(true, .authorized)
                } else if status == .notDetermined {
                    completion(false, .notDetermined)
                } else if status == .restricted {
                    completion(false, .restricted)
                }
            }
            break
        }
        
    }
    
}
