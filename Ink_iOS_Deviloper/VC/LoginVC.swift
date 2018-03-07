import UIKit


extension UITextField {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height-height, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}


class LoginVC: UIViewController {
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var Pw: UITextField!
    @IBAction func LoginBtn(_ sender: Any) {
        let model = LoginNM(self)
        let id = gsno(Id.text)
        let pw = gsno(Pw.text)
        model.Login(email: id, pwd: pw)
    }
    
    @IBAction func JoinBtn(_ sender: Any) {
        let joinView = self.storyboard!.instantiateViewController(withIdentifier: "joinVC")
        self.present(joinView, animated: true)
    }
    
    
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Id.placeholder = "이름"
        
        Id.addBorderBottom(height: 1.0, color:UIColor.brown)
        Pw.addBorderBottom(height: 1.0, color:UIColor.brown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension LoginVC: NetworkCallBack
{
    func networkResultData(resultData: Any, code: String) {
        
        if code == "Loginsuccess" {
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "tabbarVC") as! TabbarVC
            self.present(nextView, animated: true,completion: nil)
            
        }
        else if code == "Loginfailed"{
            let alert = UIAlertController(title: "", message: "id와 비밀번호를 확인하세요", preferredStyle: UIAlertControllerStyle.alert)
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

