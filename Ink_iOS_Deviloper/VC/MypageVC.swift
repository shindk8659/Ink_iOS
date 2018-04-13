//
//  MypageVC.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 28..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MypageVC: UIViewController , UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    var mypagelist : [MypageData] = []
    var myinfo : SignupLoginData?
    
    override func viewDidLoad() {
        
        let mypagelistmodel = MypageNM(self)
        
        mypagelistmodel.mypagelist()
        mypagelistmodel.mypage()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.register(UINib.init(nibName: "NewspeedCell", bundle: nil), forCellWithReuseIdentifier: "NewspeedCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        collectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let listheaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "newspeedHeader", for: indexPath) as! NewspeedCollectionReusableView
        
        listheaderView.dailyword.text = gsno(myinfo?.email)
        
        return listheaderView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mypagelist.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewspeedCell", for: indexPath) as! NewspeedCell
        cell.comment.addTarget(self, action: #selector(movecommentpage(_:)), for: .touchUpInside)
        cell.headerlabel.text = mypagelist[indexPath.item].topic_text
        cell.descriptionlabel.text = mypagelist[indexPath.item].bulletin_text
        cell.likecount.text = String(describing: mypagelist[indexPath.item].bulletin_good_count!)
        
        return cell
    }
    @objc func movecommentpage(_ sender: UIButton){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "commentvc") as! CommentVC
        navigationController?.pushViewController(nextView, animated: true)
        
    }
    
}
extension MypageVC: NetworkCallBack
{
    func networkResultData(resultData: Any, code: String) {
        
       if code == "getmypostlist"{
        mypagelist = resultData as! [MypageData]
        
        self.collectionView.reloadData()
        }
       else if code == "getmyinfo" {
        
        myinfo = resultData as? SignupLoginData
         self.collectionView.reloadData()
       }
       else if code == "loginfail" {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        let alert = UIAlertController(title: "로그인오류", message: "다시 로그인 해주세요.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"로그인", style: .default) { _ in self.present(nextView, animated: true, completion: nil)})
        
        self.present(alert, animated: true, completion: nil)
        
        
        }
       else{
        let alert = UIAlertController(title: "네트워크 오류", message: "파라미터를 확인하세요", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        }
    }
}

