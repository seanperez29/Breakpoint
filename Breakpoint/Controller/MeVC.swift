//
//  MeVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard!.instantiateViewController(withIdentifier: "AuthVC") as! AuthVC
                self.present(authVC, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancelAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    

}
