//
//  JoinVC.swift
//  Ink_iOS_Deviloper
//
//  Created by mac on 2018. 2. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit


class JoinVC: UIViewController {

    
    @IBAction func cancelButton(_ sender: Any) {
     presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var Pw: UITextField!
    
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var duplicate: UIButton!
    @IBOutlet weak var joinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Id.placeholder = "이름"
        Id.addBorderBottom(height: 1.0, color: UIColor.brown)
        Pw.addBorderBottom(height: 1.0, color: UIColor.brown)
        joinLabel.addBorderBottom(height: 1.0, color: UIColor.brown)
        joinBtn.addTarget(self, action: #selector(join), for: .touchUpInside)
        duplicate.addTarget(self, action: #selector(dup), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
   

    @objc func dup() {
        
        let model = SignupNM(self)
        let id = gsno(Id.text)
        
        model.EmailDupicate(email: id)
    }
    @objc func join() {
       
        let model = SignupNM(self)
      
        if (Id.text != "" )||(Pw.text != ""){
            
            let id = gsno(Id.text)
            let pw = gsno(Pw.text)
             model.Signup(email: id, pwd: pw)
        }
        else{
            let alert = UIAlertController(title: "", message: "입력을 해주세요", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

}
extension JoinVC: NetworkCallBack
{
    func networkResultData(resultData: Any, code: String) {
        
        if code == "signupsuccess" {
            presentingViewController?.dismiss(animated: true)
        }
        else if code == "dupsuccess"{
            let alert = UIAlertController(title: "", message: "계정사용 가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if code == "email duplicate"{
            let alert = UIAlertController(title: "계정중복", message: "계정이 중복입니다.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            let alert = UIAlertController(title: "네트워크 오류", message: "파라미터를 확인하세요", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
           
            
        }
    }
}

