//
//  UIViewExt.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: Notification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - beginningFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }

    func unbindToKeyboard() {
        NotificationCenter.default.removeObserver(self)
    }
//
//    @objc func keyboardWillShow(_ notification: Notification) {
//        adjustForKeyboardHeight(show: true, notification: notification)
//    }
//
//    @objc func keyboardWillHide(_ notification: Notification) {
//        adjustForKeyboardHeight(show: false, notification: notification)
//    }
//
//    func adjustForKeyboardHeight(show: Bool, notification: Notification) {
//        let userInfo = notification.userInfo ?? [:]
//        let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
//        if show {
//            frame.origin.y = keyboardSize * (-1)
//        } else {
//            frame.origin.y = 0
//        }
//    }
}
