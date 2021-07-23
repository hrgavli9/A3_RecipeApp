//
//  UserChoiceVc.swift
//  A3_RecipeApp
//
//  Created by Dipak on 20/04/1943 Saka.
//

import UIKit

class UserChoiceVc: UIViewController {

    var getfoodtype = ""
    var getfoodstyle = ""
    private let lbfoodtype:UILabel = {
        let lb=UILabel()
        lb.text="Choose the food type..."
        lb.backgroundColor = .clear
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    private let mysegment:UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Vegiterian", at: 0, animated: true)
        segment.insertSegment(withTitle: "NonVegiterian", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentfunc), for:.valueChanged)
        return segment
    }()
    @objc func segmentfunc() {
        print(mysegment.selectedSegmentIndex)
        
        if mysegment.selectedSegmentIndex == 1
        {
            getfoodtype = "Non-vegitarian"
        }
        else
        {
            getfoodtype = "vegitarian"
        }
        
    }
    
    
    private let lbfoodstyle:UILabel = {
        let lb=UILabel()
        lb.text="Choose the food style..."
        lb.backgroundColor = .clear
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    let foodStyle = UIPickerView()
    let foodStyleData = ["Indian","Chinese","Italian"]
    
    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.addTarget(self, action: #selector(btnfunc), for: .touchUpInside)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 10
        return btn
    }()
    @objc func btnfunc() {
        
        
        if getfoodtype == ""
        {
            getfoodtype = "vegitarian"
            print(getfoodtype)
        }
        else
        {
            print(getfoodtype)
        }
        
        if getfoodstyle == ""
        {
            getfoodstyle = "Indian"
            print(getfoodstyle)
        }
        else
        {
            print(getfoodstyle)
        }
        
        let vc = RecipeVc()
        vc.passfoodstyle = getfoodstyle
        vc.passfoodtype = getfoodtype
        
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "User choice"
        view.addSubview(mysegment)
        view.addSubview(foodStyle)
        view.addSubview(lbfoodtype)
        view.addSubview(lbfoodstyle)
        view.addSubview(myButton)
        foodStyle.dataSource = self
        foodStyle.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lbfoodtype.frame = CGRect(x: 10, y:view.safeAreaInsets.top+100 , width: view.width-60, height: 60)
        mysegment.frame = CGRect(x: 10, y:lbfoodtype.bottom+10 , width: view.width-60, height: 60)
        lbfoodstyle.frame = CGRect(x: 10, y: mysegment.bottom+30, width: view.width-60, height: 60)
        foodStyle.frame = CGRect(x: 10, y: lbfoodstyle.bottom+10, width: view.width-60, height: 100)
        myButton.frame = CGRect(x: 40, y: foodStyle.bottom+40, width: view.width-60, height: 60)
    }
}
extension UserChoiceVc:UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        foodStyleData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        foodStyleData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(foodStyleData[row])
        getfoodstyle = foodStyleData[row]
        
    }
    
    
    
}
