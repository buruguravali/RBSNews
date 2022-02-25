//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

protocol LoginControllerDelegate {
    func navigateToNextScreen()
    func showAlert(message: String)
}
class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen"
        loginViewModel.delegate = self
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginViewModel.validateLogin(userName: usernameTextField.text, password: passwordTextField.text)
    }
    
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true)
            }
        }
    }
    
}

extension LoginViewController : LoginControllerDelegate {
    func navigateToNextScreen() {
        self.navigateToHomeScreen()
    }
    
    func showAlert(message: String) {
        Utility.shared.showAlert(self, "Alert !", message)
    }
}
