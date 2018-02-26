//
//  JoinVC.swift
//  Ink_iOS_Deviloper
//
//  Created by mac on 2018. 2. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit


extension UILabel {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height-height, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}



class JoinVC: UIViewController {

    
    @IBAction func cancelButton(_ sender: Any) {
        
        let homeView = self.storyboard!.instantiateViewController(withIdentifier: "loginVC")
        self.present(homeView, animated: true)
    }
    
    
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var Pw: UITextField!
    
    @IBOutlet weak var joinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Id.placeholder = "이름"
        Id.addBorderBottom(height: 1.0, color: UIColor.brown)
        Pw.addBorderBottom(height: 1.0, color: UIColor.brown)
        joinLabel.addBorderBottom(height: 1.0, color: UIColor.brown)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
