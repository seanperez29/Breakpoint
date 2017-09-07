//
//  GroupsVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Constants.URLs.Groups.observe(.value) { snapshot in
            DataService.instance.getAllGroups { groupsArray in
                self.groups = groupsArray
                self.tableView.reloadData()
            }
        }
    }

}

extension GroupsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.GroupCell, for: indexPath) as! GroupCell
        let group = groups[indexPath.row]
        cell.configureCell(group)
        return cell
    }
}

