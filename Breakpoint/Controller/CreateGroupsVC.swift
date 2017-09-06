//
//  CreateGroupsVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var emailSearchLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.UserCell, for: indexPath) as! UserCell
        let profileImage = #imageLiteral(resourceName: "defaultProfileImage")
        cell.configureCell(profileImage: profileImage, email: "jimmy@aol.com", isSelected: true)
        return cell
    }
}
