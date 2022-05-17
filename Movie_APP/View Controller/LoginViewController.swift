//
//  LoginViewController.swift
//  Movie_APP
//
//  Created by Donia Elshenawy on 13/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

   
    @IBOutlet weak var nameTextField: UITextField!
    
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let userName = nameTextField.text else { return  }
        guard let password = passwordTextField.text else { return  }
        
        let flag = checkNamePassword(name: userName, password: password)
        
        
        if (flag){
            let userDefault = UserDefaults.standard
            userDefault.set(true, forKey: "Login state")
            
            
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            // remove back
            if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {

                                delegate.window?.rootViewController = vc
                                delegate.window?.makeKeyAndVisible()

                        }
           
//           let appDelegate = UIApplication.shared.delegate as! AppDelegate
//           appDelegate.window?.rootViewController = vc
            
          //  self.navigationController?.pushViewController(vc, animated: true)
                
        }
        else{
            print("Faild login!")
        }
        
    }
    
    func checkNamePassword(name : String, password : String) -> Bool{
        if (name == "Donia" && password == "1234"){
            return true
        }
        else{
            return false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
