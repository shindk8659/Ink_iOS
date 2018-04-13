//
//  CustomExtension.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.characters.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.characters.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}



extension UITableViewCell {
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
}
extension UICollectionReusableView {
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
}

extension UIView
{
    func customLayer()
    {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 2.0
    }
    
    func shake(_ value: Double) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-value, value, -value*(2/3), value*(2/3), -value*(1/3), value*(1/3), 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces).trimmingCharacters(in: CharacterSet.newlines)
    }
    func NilOrEmpty()->Bool{
        if(self.trim().isEmpty){return true}
        else{return false}
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    func networkFailed(msg: Any?) {
        let alert = UIAlertController(title: "네트워크 오류", message: "서버가 응답하지 않습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
}



