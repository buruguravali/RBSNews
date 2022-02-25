//
//  LoginViewModel.swift
//  RBSNews
//
//  Created by Ravali Burugu on 25/02/2022.
//

import Foundation

protocol LoginViewModelDelegate {
    func validateLogin(userName : String?, password : String?)
}

let expectedUsername = "rbs"
let expectedPassword = "1234"

class LoginViewModel : LoginViewModelDelegate {
    var delegate: LoginControllerDelegate?
    
    func validateLogin(userName: String?, password: String?) {
        guard let username = userName, !username.isEmpty, let pwd = password, !pwd.isEmpty else {
            delegate?.showAlert(message: "Please input credentials.")
            return
        }
        guard expectedUsername == username else {
            delegate?.showAlert(message: "Username is invalid.")
            return
        }
        guard expectedPassword == password else {
            delegate?.showAlert(message: "Password is invalid.")
           return
        }
        delegate?.navigateToNextScreen()
    }

}
