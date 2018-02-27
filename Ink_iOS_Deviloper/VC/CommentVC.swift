//
//  CommentViewController.swift
//  Doodle
//
//  Created by 신동규 on 2018. 1. 10..
//  Copyright © 2018년 DongkyuShin. All rights reserved.
//

import UIKit

class CommentVC: UIViewController , UICollectionViewDataSource{
     var keyboardHeight : CGFloat = 216
    @IBOutlet weak var commentcollectionView: UICollectionView!
    
    let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
                       "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
                       "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus.","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
    @IBOutlet var chatView: UIView!
    @IBOutlet var chatViewBotConst: NSLayoutConstraint!
    @IBOutlet var chatTextField: UITextField!
 
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillHide), name: .UIKeyboardWillHide,
                                         object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillShow), name: .UIKeyboardWillShow,
                                         object: nil)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        commentcollectionView.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellWithReuseIdentifier: "CommentCell")
        if let flowLayout = commentcollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
       commentcollectionView.dataSource = self
        
    }
    @objc func keyboardWillShow(_ notification:NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height}
        print("keykeyboardHeight: \(keyboardHeight)")
        moveToolbarUp(with: notification)
        chatViewBotConst.constant = -keyboardHeight // 툴바 문제 해결
    }
    @objc func keyboardWillHide(_ notification:NSNotification) {
        chatViewBotConst.constant = 0// 툴바 문제 해결
        moveToolbarDown(with: notification)
        if let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval {
            UIView.animate(withDuration: animationDuration, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    fileprivate func moveToolbarUp(with notification:NSNotification) {
        self.moveToolBar(isUp: true, with: notification)
    }
    
    fileprivate func moveToolbarDown(with notification:NSNotification) {
        self.moveToolBar(isUp: false, with: notification)
    }
    fileprivate func moveToolBar(isUp up:Bool, with notification:NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let animationOptions = UIViewAnimationOptions(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).uintValue)
            
            let frame = self.chatView.frame
            let rect:CGRect = CGRect(x: frame.origin.x,
                                     y: frame.origin.y + endFrame.size.height * (up ? -1 : 1),
                                     width: frame.size.width,
                                     height: frame.size.height)
            UIView.animate(withDuration: duration,
                           delay: 0.0,
                           options: animationOptions,
                           animations: { () -> Void in
                            self.chatView.frame = rect
            }, completion: nil)
        }else{
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let listheaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "commentHeader", for: indexPath) as! CommentCollectionReusableView
        
        
        return listheaderView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCell", for: indexPath) as! CommentCell
        cell.headerLabel.text = "신동규"
        cell.descriptionLabel.text = randomTexts[indexPath.row]
        
        return cell
    }
    
    
}

   
    






