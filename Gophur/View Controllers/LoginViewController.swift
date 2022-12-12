//
//  LoginViewController.swift
//  Gophur
//
//  Created by Jack Edelist on 2022-11-26.
//

import UIKit
import FirebaseAuth
import SwiftUI

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var BackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        ErrorLabel.alpha = 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func LogInTapped(_ sender: Any) {
        //validate text fields
        
        
        //create text fields
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //sign in user
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil {
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else {
                //direct user to home page
                let hostingController = UIHostingController(rootView: HomeSwiftUIView())
                self.navigationController?.pushViewController(hostingController, animated: true)
                
                
                
                //OLD CODE
//                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
                
            }
            
        }
        
    }
    
}
