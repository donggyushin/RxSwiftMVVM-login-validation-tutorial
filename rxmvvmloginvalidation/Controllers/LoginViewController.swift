//
//  LoginViewController.swift
//  rxmvvmloginvalidation
//
//  Created by 신동규 on 2021/01/10.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {

    
    // MARK: Properties
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var loginTextField:MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField()
        tf.label.text = "Id"
        tf.placeholder = "Insert your login id"
        tf.leadingAssistiveLabel.text = "This is helper text"
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.sizeToFit()
        return tf
    }()
    
    private lazy var passwordTextField:MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField()
        tf.label.text = "Pw"
        tf.placeholder = "Insert your login password"
        tf.leadingAssistiveLabel.text = "This is helper text"
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.sizeToFit()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton:MDCButton = {
        let bt = MDCButton()
        bt.accessibilityLabel = "Login"
        bt.setTitle("Login", for: UIControl.State.normal)
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bt.setBackgroundColor(UIColor.purple)
        bt.alpha = 0.3
        bt.isUserInteractionEnabled = false 
        return bt
    }()
    
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 50
        return stack
    }()
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureKeyboard()
        configureUI()
        bindTextField()
    }
    
    // MARK: Helpers
    func bindTextField() {
        loginTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.idPublishSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.pwPublishSubject).disposed(by: disposeBag)
        
        viewModel.loginValidator().subscribe(onNext:{valid in
            self.loginButton.isUserInteractionEnabled = valid
            if valid {
                self.loginButton.alpha = 1
            }else {
                self.loginButton.alpha = 0.3
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: Configures
    
    
    func configureKeyboard() {
        dismissKeyboardWhenTappedAround()
        moveViewWhenKeyboardAppearedOrDisappeared()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true 
    }

}
