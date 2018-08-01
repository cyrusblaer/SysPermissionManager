//
//  MenuViewController.swift
//  SysPermissionTest
//
//  Created by Blaer on 2018/7/30.
//  Copyright © 2018 curusblaer. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    var itemList: [String] = ["Photo", "Camera", "Media", "Microphone", "Location", "Bluetooth", "PushNotification", "Speech", "Event", "Contacts", "Reminder"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        cell.title = itemList[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC")
//
//        navigationController?.pushViewController(vc!, animated: true)
        
        switch indexPath.row {
        case 0:
            PrivacyPermission.accessPermission(with: .photo) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 1:
            PrivacyPermission.accessPermission(with: .camera) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 2:
            PrivacyPermission.accessPermission(with: .media) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 3:
            PrivacyPermission.accessPermission(with: .microphone) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 4:
            PrivacyPermission.accessPermission(with: .location) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 5:
            PrivacyPermission.accessPermission(with: .bluetooth) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 6:
            PrivacyPermission.accessPermission(with: .pushNotification) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 7:
            PrivacyPermission.accessPermission(with: .speech) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 8:
            PrivacyPermission.accessPermission(with: .event) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 9:
            PrivacyPermission.accessPermission(with: .contact) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        case 10:
            PrivacyPermission.accessPermission(with: .reminder) { (response, status) in
                print("Response: \(response), Status: \(status)")
            }
        default:
            break
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
