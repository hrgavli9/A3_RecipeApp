//
//  RecipeInstructionsVc.swift
//  A3_RecipeApp
//
//  Created by Dipak on 28/04/1943 Saka.
//

import UIKit

class RecipeInstructionsVc: UIViewController {

    private let Header:UILabel = {
        let lb=UILabel()
        lb.text="Instructions"
        lb.backgroundColor = .purple
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = UIFont.italicSystemFont(ofSize: 50.0)
        return lb
    }()
    
    private let steps:UILabel = {
        let lb=UILabel()
        lb.text="""
            2 cup soaked overnight red kidney beans
            1 teaspoon red chilli powder
            4 tablespoon butter
            1 large chopped onion
            1/2 cup tomato puree
            1/2 cup fresh cream
            1/2 teaspoon ginger paste
            water as required
            salt as required
            2 inch chopped ginger
            1 tablespoon refined oil
            2 medium sliced & slit green chilli
            1 teaspoon garam masala powder
            1/2 cup soaked overnight urad dal
            1/2 teaspoon garlic paste
            """
        lb.backgroundColor = .systemYellow
        lb.textColor = .black
        lb.textAlignment = .left
        lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = 0;
        lb.font = UIFont.systemFont(ofSize: 20.0)
        return lb
    }()
    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("click", for: .normal)
        btn.addTarget(self, action: #selector(btnfunc), for: .touchUpInside)
        btn.backgroundColor = .systemPink
        btn.layer.cornerRadius = 10
        return btn
    }()
    @objc func btnfunc() {
        navigationController?.pushViewController(RecipeDetailVc(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(Header)
        view.addSubview(steps)
        view.addSubview((myButton))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Header.frame = CGRect(x: 10, y: view.safeAreaInsets.top+5, width: view.width-20, height: 100)
        steps.frame = CGRect(x: 10, y: Header.bottom+10, width: view.width-20, height: 500)
        myButton.frame = CGRect(x: 300, y: steps.bottom+10, width:view.width-50, height:40)
    }

}
