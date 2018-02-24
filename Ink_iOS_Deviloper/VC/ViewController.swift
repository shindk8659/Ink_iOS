import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myname: UILabel!
    @IBAction func nextpage(_ sender: Any) {
        
        let nextView = self.storyboard!.instantiateViewController(withIdentifier: "nextView") as! ViewController2
    
      
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction func sendname(_ sender: Any) {
        if myname.text == "오은주" {
            let alert = UIAlertController(title: myname.text, message: "신동규로 바꿈", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            myname.text = "신동규"
        }
        else{
        let alert = UIAlertController(title: myname.text, message: "오은주로 바꿈", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        myname.text = "오은주"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
