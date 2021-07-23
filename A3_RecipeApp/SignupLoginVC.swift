//
//  SignupLoginVC.swift
//  A3_RecipeApp
//
//  Created by Dipak on 12/04/1943 Saka.
//

import UIKit

class SignupLoginVC: UIViewController {
    
//    Email Label
    private let lbEmail:UILabel = {
        let lb=UILabel()
        lb.text="EmailId"
        lb.backgroundColor = .clear
        lb.textColor = .black
        lb.textAlignment = .left
        return lb
    }()
    
//    Email textfield
    private let emailId:UITextField = {
        let mytext = UITextField()
//        mytext.placeholder = "EmailId"
        mytext.textAlignment = .center
        mytext.textColor = .black
        mytext.backgroundColor = .white
        mytext.layer.cornerRadius = 15
        return mytext
    }()
    
//    Password Label
    private let lbPswd:UILabel = {
        let lb=UILabel()
        lb.text="Password"
        lb.backgroundColor = .clear
        lb.textColor = .black
        lb.textAlignment = .left
        return lb
    }()
    
//    Password textfield
    private let pswd:UITextField = {
        let mytext = UITextField()
//        mytext.placeholder = " name"
        mytext.textAlignment = .center
        mytext.textColor = .black
        mytext.backgroundColor = .white
        mytext.layer.cornerRadius = 15
        return mytext
    }()
    
//    Login Button
    private let Login:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.addTarget(self, action: #selector(btnloginfunc), for: .touchUpInside)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 10
        return btn
    }()
    @objc func btnloginfunc() {
       
    }
    
//    Skip button
    private let lbSkip:UIButton = {
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.addTarget(self, action: #selector(btnskipfunc), for: .touchUpInside)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 10
        return btn
    }()
    @objc func btnskipfunc() {
        navigationController?.pushViewController(UserChoiceVc(), animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login "
        view.backgroundColor = .systemYellow
        view.addSubview(emailId)
        view.addSubview(pswd)
        view.addSubview(Login)
        view.addSubview(lbPswd)
        view.addSubview(lbEmail)
        view.addSubview(lbSkip)
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        lbEmail.frame = CGRect(x: 40, y: view.safeAreaInsets.top+100, width: view.width-60, height: 50)
        emailId.frame = CGRect(x: 40, y: lbEmail.bottom, width: view.width-60, height: 50)
        lbPswd.frame = CGRect(x: 40, y: emailId.bottom+20, width: view.width-60, height: 50)
        pswd.frame = CGRect(x: 40, y: lbPswd.bottom, width: view.width-60, height: 50)
        Login.frame = CGRect(x: 50, y: pswd.bottom+40, width: view.width-70, height: 50)
        lbSkip.frame = CGRect(x: 50, y: Login.bottom, width: view.width-70, height: 50)
    }
}
