//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    var didBeginTypingMessage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        guard let text = messageTextView.text, text != "" && didBeginTypingMessage else { return }
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        DataService.instance.uploadPost(withMessage: text, forUID: userUID, withGroupKey: nil) { success in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        didBeginTypingMessage = true
        textView.text = ""
    }
    
}
