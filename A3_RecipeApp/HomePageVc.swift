//
//  HomePageVc.swift
//  A3_RecipeApp
//
//  Created by Dipak on 11/04/1943 Saka.
//

import UIKit

class HomePageVc: UIViewController {

    
    private let myimgview:UIImageView = {
        let imgview=UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 0
//        imgview.alpha = 0
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "HomePage-1")
//        imgview.backgroundColor = .black
        return imgview
    }()
    
    private let mylabel:UILabel = {
        let lb=UILabel()
        lb.text="Mom's"
//        lb.font = .monospacedDigitSystemFont(ofSize: 100, weight: .bold)
        lb.font = .italicSystemFont(ofSize: 100)
        lb.backgroundColor = .clear
        lb.textColor = .white
        lb.textAlignment = .left
        return lb
    }()
    
    private let mylabel1:UILabel = {
        let lb=UILabel()
        lb.text="Recipe"
        lb.font = .italicSystemFont(ofSize: 100)
//        lb.font = .boldSystemFont(ofSize: 50)
        lb.backgroundColor = .clear
        lb.textColor = .white
        lb.textAlignment = .center
        return lb
    }()
    
    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle(">>>", for: .normal)
        btn.addTarget(self, action: #selector(btnfunc), for: .touchUpInside)
        btn.backgroundColor = .systemPink
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    @objc func btnfunc() {
        navigationController?.pushViewController(SignupLoginVC(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(myimgview)
        myimgview.addSubview(mylabel)
        myimgview.addSubview(mylabel1)
        view.addSubview(myButton)
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myimgview.frame = CGRect(x: 0, y:view.safeAreaInsets.top, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-30)
        mylabel.frame = CGRect(x: 20, y: 130, width: view.width-20, height: 100)
        mylabel1.frame = CGRect(x: 20, y: mylabel.bottom+10, width: view.width-20, height: 100)
        myButton.frame = CGRect(x: 300, y: myimgview.bottom+10, width:100, height:30)
    }
    
}
