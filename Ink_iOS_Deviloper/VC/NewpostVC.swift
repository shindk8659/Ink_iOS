//
//  NewpostVC.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class NewpostVC: UIViewController {

    @IBOutlet weak var selectTopic: UIButton!
    @IBOutlet weak var ink: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var submitNewspeed: UIButton!
    
    var inkamount:Int = 0
    var topicArray : [TopicData] = []
    var profileData : SignupLoginData?

    @IBAction func postmyfeed(_ sender: Any) {
        
        let postmyfeedmodel = NewpostNM(self)
        let text = gsno(textView.text)
        let topic = selectTopic.title(for: .normal)
        if text == "" {
            let alert = UIAlertController(title: "", message: "글을 작성해주세요.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if selectTopic.title(for: .normal) == "글감 선택"{
            let alert = UIAlertController(title: "", message: "글감을 선택해주세요.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            
            postmyfeedmodel.postmyfeed(bulletin_text: text, topic_text: gsno(topic))
        }
        
    }
    
   
    @IBAction func postnewspeed(_ sender: Any) {
        
        let postnewspeedmodel = NewpostNM(self)
        let text = gsno(textView.text)
        let topic = selectTopic.title(for: .normal)
        
            if text == "" {
                let alert = UIAlertController(title: "", message: "글을 작성해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else if selectTopic.title(for: .normal) == "글감 선택"{
                let alert = UIAlertController(title: "", message: "글감을 선택해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                if  inkamount > 3{
                     postnewspeedmodel.postnewspeed(bulletin_text: text, topic_text: gsno(topic), bulletin_ink: 3 )
                    
                }
                else{
                    let alert = UIAlertController(title: "", message: "잉크가 부족합니다.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
               
            }
        }
    
    
    
    @IBAction func selectTpc(_ sender: Any) {
        
    
        let alertController = UIAlertController(title: "글감선택", message: "글감을 선택해주세요", preferredStyle: .alert)
        
        for i in 0..<topicArray.count{
            
            alertController.addAction(UIAlertAction(title:topicArray[i].topic_text, style: .default) { _ in self.selectTopic.setTitle(self.topicArray[i].topic_text, for: .normal) })
        }
        
        
        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            
        }
        
        alertController.addAction(DestructiveAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        }
    
    
    
    override func viewDidLoad() {
        
        let gettopicmodel = NewpostNM(self)
        gettopicmodel.topic()
        let getmypagemodel = MypageNM(self)
        getmypagemodel.mypage()
        
        
        textView.placeholder = "당신의 이야기를 들려주세요..."
        textView.layer.borderWidth = 2.0
        textView.layer.borderColor=UIColor.darkGray.cgColor
        
        
        super.viewDidLoad()
    }
}

extension NewpostVC: NetworkCallBack
{
    func networkResultData(resultData: Any, code: String) {
        
        if code == "postmyfeedsuccess" {
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "tabbarVC")
            self.present(nextView, animated: true,completion: nil)
            
        }
        else if code == "postnewspeedsuccess"{
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "tabbarVC")
            self.present(nextView, animated: true,completion: nil)
        }
        else if code == "gettopicsuccess"{
            topicArray = resultData as! [TopicData]
        }
        else if code == "getmyinfo"{
            profileData = resultData as? SignupLoginData
            inkamount = gino(profileData?.ink)
            ink.text = String(inkamount)
        }
    
        else {
            let alert = UIAlertController(title: "네트워크 오류", message: "파라미터를 확인하세요", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
