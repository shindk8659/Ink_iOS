//
//  NewpostVC.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import QuartzCore

class NewpostVC: UIViewController {
    
    @IBOutlet weak var selectTopic: UIButton!
    @IBOutlet weak var ink: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var submitNewspeed: UIButton!
  
    

    
    
    @IBAction func Select(_ sender: Any) {
        
        let alertController = UIAlertController(title: "글감선택", message: "글감을 선택해주세요", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let oneAction = UIAlertAction(title: "One", style: .default) { _ in }
        let twoAction = UIAlertAction(title: "Two", style: .default) { _ in }
        let threeAction = UIAlertAction(title: "Three", style: .default) { _ in }
   
        
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        
        
        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            
            print("취소")
            
        }
        
        alertController.addAction(DestructiveAction)
        
        self.present(alertController, animated: true, completion: nil)

        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "작성취소", message: "작성중인 글이 사라집니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print(action)
        }
        alertController.addAction(cancelAction)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive) { action in
            print(action)
        }
        alertController.addAction(destroyAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
        
//        let alertController = UIAlertController(title: "작성취소", message: "작성중인 글이 사라집니다.", preferredStyle: UIAlertControllerStyle.alert)
//
//        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
//
//            print("취소")
//
//        }
//
//        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
//
//            print("확인")
//
//        }
//
//        alertController.addAction(DestructiveAction)
//
//        alertController.addAction(okAction)
//
//        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtField.layer.borderWidth = 1.0
        self.txtField.layer.borderColor=UIColor.black.cgColor
    
        submit.layer.borderColor=UIColor.darkGray.cgColor
        submit.layer.borderWidth = 2.0
        submitNewspeed.layer.borderColor=UIColor.darkGray.cgColor
        submitNewspeed.layer.borderWidth = 2.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}

