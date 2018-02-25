import UIKit

class LoginVC: UIViewController {
    
    
    @IBAction func nextpage(_ sender: Any) {
        
        let nextView = self.storyboard!.instantiateViewController(withIdentifier: "tapbarVC")
            self.present(nextView, animated: true)
        
        
    }
    
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var Pw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
