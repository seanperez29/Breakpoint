//
//  FeedVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {}
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DataService.instance.getAllFeedMessages { messages in
            self.messages = messages.reversed()
            self.tableView.reloadData()
        }
    }

}

extension FeedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.FeedCell, for: indexPath) as! FeedCell
        let image = #imageLiteral(resourceName: "defaultProfileImage")
        let message = messages[indexPath.row]
        cell.configureCell(profileImage: image, message: message)
        return cell
    }
}

