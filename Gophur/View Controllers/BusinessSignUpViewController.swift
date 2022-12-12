//
//  BusinessSignUpViewController.swift
//  Gophur
//
//  Created by Jack Edelist on 2022-12-06.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class BusinessSignUpViewController: UIViewController {
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var AddressTextField: UITextField!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var PhoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func validateFields() -> String? {
        //all fields filled in
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            UsernameTextField.text?.trimmingCharacters(in:  .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in:  .whitespacesAndNewlines) == "" ||
            AddressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PhoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    
    //method for showing error message
    func showError(_ message:String) {
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    
    //method for transitioning to home VC and assigning it root VC
    func transitionToHome() {
        let hostingController = UIHostingController(rootView: HomeSwiftUIView())
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
    
    
    
    
    //SIGN IN TAPPED
    @IBAction func SignUpTapped(_ sender: Any) {
        //validate the fields
        let error = validateFields()
        
        if error != nil {
            //print error message
            showError(error!)
        }
        else {
            //clean data
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = UsernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let address = AddressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phone = PhoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                
                //check for errors
                if err != nil {
                    
                    //there was an error creating user
                    self.showError("Error creating user")
                }
                else {
                    //user was created, store details
                    let db = Firestore.firestore()
                    
                    db.collection("businesses").document(result!.user.uid).setData(["username": username, "uid": result!.user.uid, "address": address, "phone": phone, "Monday": Array<String>(), "Tuesday": Array<String>(), "Wednesday": Array<String>(), "Thursday": Array<String>(), "Friday": Array<String>()]) { (error) in
                        
                        if error != nil {
                            //error storing info
                            self.showError("Database error, please try again.")
                        }
                    }
                    //transition to home screen
                    self.transitionToHome()
                }
            }
        } // end else
    }
}

    
    
    

