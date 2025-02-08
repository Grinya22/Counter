//
//  ViewController.swift
//  Counter
//
//  Created by Gregory Vanyurin on 29.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rememberSwitch: UISwitch!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    var savedUsername: String = ""
    var savedPassword: String = ""
    var rememberMe: Bool = false
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard userPasswordField != nil else {return}
        guard usernameField != nil else {return}
        
        userPasswordField.isSecureTextEntry = true
        
        savedUsername = UserDefaults.standard.string(forKey: "savedUsername") ?? ""
        rememberMe = UserDefaults.standard.bool(forKey: "rememberUser")
        savedPassword = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
        
        if rememberMe {
            usernameField.text = savedUsername
            rememberSwitch.isOn = true
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func clickedButtonLogIn(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = userPasswordField.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            return
        }
        
        if rememberSwitch.isOn {
            UserDefaults.standard.set(username, forKey: "savedUsername")
            UserDefaults.standard.set(true, forKey: "rememberUser")
        } else {
            UserDefaults.standard.removeObject(forKey: "savedUsername")
            UserDefaults.standard.set(false, forKey: "rememberUser")
        }
        
        // Переход на экран счётчика (с полным открытием)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            destinationVC.modalPresentationStyle = .fullScreen  // Полноэкранный режим
            present(destinationVC, animated: true, completion: nil)
        }
    }
    
}
