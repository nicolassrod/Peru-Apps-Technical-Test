//
//  LoginViewController.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/3/20.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    var loginUseCase: LoginUseCase!
    var loginData: UserLoginResponse? {
        didSet {
            guard let token = loginData?.data.token else {
                return
            }
            _ = loginUseCase.save(token: token)
            DispatchQueue.main.async {
                self.showHomeViewController()
            }
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginUseCase = LoginUseCase(repository: LoginRepository())
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginUseCase
            .loginWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished")
                }
            }) { [weak self] data in
                self?.loginData = data
                print(data)
            }
            .store(in: &cancellables)
    }
    
    func showHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "movieNavigationViewController") as? UINavigationController {
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
}
