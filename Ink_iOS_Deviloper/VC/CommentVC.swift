//
//  CommentViewController.swift
//  Doodle
//
//  Created by 신동규 on 2018. 1. 10..
//  Copyright © 2018년 DongkyuShin. All rights reserved.
//

import UIKit

class CommentVC: UIViewController , UICollectionViewDataSource{

    
    let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
                       "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
                       "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
    var commentindex:Int = 0
    var userindex = 0
    var tabbarheight: CGFloat = 0
    var keyboardHeight : CGFloat = 216
    var token = UserDefaults.standard.string(forKey: "token")
    
    @IBOutlet var chatView: UIView!
    @IBOutlet var chatViewBotConst: NSLayoutConstraint!
    @IBOutlet var chatTextField: UITextField!
    
    @IBAction func backgroundTap(_ sender: Any) {
        chatTextField.endEditing(true)
    }
    
    @IBAction func Btn(_ sender: Any) {
        
       /* let networkManager = CommentNetworkManager(self)
        let code = "commentsend"
        let header = gsno(token)
        networkManager.networkingRequestCommentSend(comment: gsno(chatTextField.text), index: commentindex, header: header , code: code)
        */
        chatTextField.text?.removeAll()
        chatTextField.endEditing(true)
    }
    /*var commentResultlist : CommentResultList?
    var commentList : [CommentList] = []
    var commentDoodle: CommentDoodle?*/
    
    
    @IBOutlet weak var commentCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        commentCollectionView.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellWithReuseIdentifier: "CommentCell")
        if let flowLayout = commentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 0.5,height: 0.5)
        }
       
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillHide), name: .UIKeyboardWillHide,
                                         object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillShow), name: .UIKeyboardWillShow,
                                         object: nil)
       
      /*  let networkManager = CommentNetworkManager(self)
        let code = "commentget"
        let header = gsno(token)
        networkManager.netWorkingRequestCommentGet(addURL: "/comments", method: .get, header: header, code:code, index: commentindex)*/
        
        commentCollectionView.dataSource = self
        
        
        super.viewDidLoad()
    }
    
    func setNaviBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = "댓글"
    }
    @objc func keyboardWillShow(_ notification:NSNotification) {
        
        if let tabBarHeight = tabBarController?.tabBar.frame.size.height{
            tabbarheight = tabBarHeight
        }
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
           
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height}
        print("keykeyboardHeight: \(keyboardHeight)")
        moveToolbarUp(with: notification)
        chatViewBotConst.constant = tabbarheight - keyboardHeight // 툴바 문제 해결
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  randomTexts.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let commentheaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "commentHeader", for: indexPath) as! CommentCollectionReusableView
        
        
        /* commentheaderView.profileImg.imageFromUrl(gsno(commentDoodle?.image), defaultImgPath: "")
         commentheaderView.nicknameLabel.text = gsno(commentDoodle?.nickname)
         commentheaderView.createdLabel.text = gsno(commentDoodle?.created)
         commentheaderView.commentLabel.text = String(gino(commentDoodle?.comment_count))
         commentheaderView.likeLabel.text = String(gino(commentDoodle?.like_count))
         commentheaderView.scrapLabel.text = String(gino(commentDoodle?.scrap_count))
         commentheaderView.postprofileImg.tag = gino(commentDoodle?.idx)
         commentheaderView.postprofileImg.addTarget(self, action: #selector(imgTabbed(_:)), for: .touchUpInside)
         
         commentheaderView.createdLabel.sizeToFit()
         commentheaderView.commentLabel.sizeToFit()
         commentheaderView.likeLabel.sizeToFit()
         commentheaderView.scrapLabel.sizeToFit()*/
        
        return commentheaderView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCell", for: indexPath) as! CommentCell
        /* let commentData = commentList[indexPath.item]
         
         cell.profileImg.imageFromUrl(gsno(commentData.profile), defaultImgPath: "")
         userindex = gino(commentList[indexPath.item].user_idx)
         cell.ProfileImgBtn.tag = userindex
         cell.ProfileImgBtn.addTarget(self, action: #selector(imgTabbed(_:)), for: .touchUpInside)
         
         
         cell.nicknameLabel.text = gsno(commentData.nickname)
         cell.commentLabel.text = gsno(commentData.content)
         
         
         cell.nicknameLabel.sizeToFit()
         cell.commentLabel.sizeToFit()*/
        cell.descriptionLabel.text = randomTexts[indexPath.row]
        return cell
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
    
}
/*extension CommentVC: NetworkCallBack{
    func networkResultData(resultData: Any, code: String) {
        if code == "commentget"{
            commentResultlist = resultData as? CommentResultList
            commentList = (commentResultlist?.comments)!
            commentDoodle = commentResultlist?.doodle
 
 
            commentCollectionView.reloadData()
        }
 
        if code == "commentsend"{
            print("dddd")
            let networkManager = CommentNetworkManager(self)
            let code = "commentget"
            let header = gsno(token)
            networkManager.netWorkingRequestCommentGet(addURL: "/comments", method: .get, header: header, code:code, index: commentindex)
 
 
        }
    }
 
 
}*/






