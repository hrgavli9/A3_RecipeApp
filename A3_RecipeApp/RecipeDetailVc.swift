//
//  RecipeDetailVc.swift
//  A3_RecipeApp
//
//  Created by Dipak on 28/04/1943 Saka.
//

import UIKit

class RecipeDetailVc: UIViewController {

    var foodData = " "
    private let foodimg:UIImageView = {
        let imgview=UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
//        imgview.alpha = 0
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "manchurian-1")
        imgview.backgroundColor = .black
        return imgview
    }()
    
    private let foodimg1:UIImageView = {
        let imgview=UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
//        imgview.alpha = 0
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "manchurian-2")
        imgview.backgroundColor = .black
        return imgview
    }()
    
    private let foodimg2:UIImageView = {
        let imgview=UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
//        imgview.alpha = 0
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "manchurian-3")
        imgview.backgroundColor = .black
        return imgview
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(foodimg)
        view.addSubview(foodimg1)
        view.addSubview(foodimg2)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        foodimg.frame = CGRect(x: 10, y:100, width: view.width-30, height: 200)
        foodimg1.frame = CGRect(x: 10, y:foodimg.bottom+10, width: view.width-30, height: 200)
        foodimg2.frame = CGRect(x: 10, y:foodimg1.bottom+10, width: view.width-30, height: 200)
      
    }
}
