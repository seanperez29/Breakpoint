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
    var emailArray = [String]()
    var selectedMembers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray.removeAll()
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, completionHandler: { emailArray in
                self.emailArray = emailArray
                self.tableView.reloadData()
            })
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.UserCell, for: indexPath) as! UserCell
        let profileImage = #imageLiteral(resourceName: "defaultProfileImage")
        if selectedMembers.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: profileImage, email: emailArray[indexPath.row], isSelected: true)
        } else {
             cell.configureCell(profileImage: profileImage, email: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenEmail = emailArray[indexPath.row]
        guard !selectedMembers.contains(chosenEmail) else {
            selectedMembers = selectedMembers.filter{ $0 != chosenEmail }
            if selectedMembers.isEmpty {
                emailSearchLabel.text = "add people to your group"
                doneButton.isHidden = true
            } else {
                emailSearchLabel.text = selectedMembers.joined(separator: ", ")
            }
            return
        }
        selectedMembers.append(chosenEmail)
        doneButton.isHidden = false
        emailSearchLabel.text = selectedMembers.joined(separator: ", ")
    }
}

extension CreateGroupsVC: UITextFieldDelegate {}
