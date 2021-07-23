//
//  RecipeVc.swift
//  A3_RecipeApp
//
//  Created by Dipak on 25/04/1943 Saka.
//

import UIKit

class RecipeVc: UIViewController, UISearchBarDelegate {

    var passfoodtype = ""
    var passfoodstyle = ""
    private var vejIndianFoodArray = ["Daal Makhni", "Pohe", "Samose", "Aloo Chat","Spring Roll", "Naan"]
    private var nvejIndianFoodArray = ["Mutton Curry", "Prawn Curry", "Butter Chicken", "Chicken Biryani","Chicken Cutlet", "Tandori Chicken"]
    private var vejItalianFoodArray = ["Hommade Raviouli", "Chery Tomato & Basil Focaccia", "Grilled Brushetta", "Arrichoke Acprese Platter"]
    private var nvejItalianFoodArray = ["Chicken Cacciatore", "Finger Liching", "Alfredo Penne Pasta", "Chicken Supreme Pasta","Jerked Chicken Pizza", "Italian Sizzler"]
    private var vejChineseFoodArray = ["Vej Manchurian", "Vij Fried Rice", "Honey Chilly Potato", "Quick Noodle","East West Spring Roll"]
    private var nvejChineseFoodArray = ["Chicken Chilli", "Garlic Chicken", "Chicken Mancurian", "Ginger Chicken","HongKong Chicken "]
    
    private let mytable = UITableView()
    private let mysearchbar = UISearchBar()
    private var searchdata = [String]()
    private var arrtouse = [String]()
    private var searching = false
    
    override func viewDidLoad()
    {
//        print(passfoodtype,passfoodstyle)
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        title = "Recipe "
        
        view.addSubview(mysearchbar)
        mysearchbar.delegate = self
        
        view.addSubview(mytable)
        mysearchbar.backgroundColor = .purple
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mysearchbar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.width-30, height: 50)
        mytable.frame = CGRect(x: 10, y: mysearchbar.bottom+5, width: view.width-20, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
    }
}
extension RecipeVc:UITableViewDelegate,UITableViewDataSource
{
    private func setup()
    {
        mytable.dataSource = self
        mytable.delegate = self
        mytable.backgroundColor = .systemOrange
        mytable.register(UITableViewCell.self, forCellReuseIdentifier: "foodData")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        searching ? searchdata.count : arrtouse.count
        if searching
        {
            return searchdata.count
        }
        else if passfoodtype == "vegitarian" && passfoodstyle == "Indian"
        {
            arrtouse = vejIndianFoodArray
            return arrtouse.count
        }
        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Indian"
        {
            arrtouse = nvejIndianFoodArray
            return arrtouse.count
        }
        else if passfoodtype == "vegitarian" && passfoodstyle == "Chinese"
        {
            arrtouse = vejChineseFoodArray
            return arrtouse.count
        }
        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Chinese"
        {
            arrtouse = nvejChineseFoodArray
            return arrtouse.count
        }
        else if passfoodtype == "vegitarian" && passfoodstyle == "Italian"
        {
            arrtouse = vejItalianFoodArray
            return arrtouse.count
        }
        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Italian"
        {
            arrtouse = nvejItalianFoodArray
            return arrtouse.count
        }
        else
        {
            arrtouse = vejIndianFoodArray
            return arrtouse.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if searching
//        {
//            arrtouse = searchdata
//        }
//        else if passfoodtype == "vegitarian" && passfoodstyle == "Indian"
//        {
//            arrtouse = vejIndianFoodArray
//        }
//        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Indian"
//        {
//            arrtouse = nvejIndianFoodArray
//        }
//        else if passfoodtype == "vegitarian" && passfoodstyle == "Chinese"
//        {
//            arrtouse = vejChineseFoodArray
//        }
//        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Chinese"
//        {
//            arrtouse = nvejChineseFoodArray
//        }
//        else if passfoodtype == "vegitarian" && passfoodstyle == "Italian"
//        {
//            arrtouse = vejItalianFoodArray
//        }
//        else if passfoodtype == "Non-vegitarian" && passfoodstyle == "Italian"
//        {
//            arrtouse = nvejItalianFoodArray
//        }
//        else
//        {
//            arrtouse = vejIndianFoodArray
//        }
//        print(arrtouse)
        let cell = tableView.dequeueReusableCell(withIdentifier:"foodData", for: indexPath)
//        print(indexPath.row)
        cell.backgroundColor = .systemOrange
        cell.textLabel?.text = arrtouse[indexPath.row]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.1
       
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30.0)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(arrtouse[indexPath.row])
        let vc = RecipeIngrediantsVc()
//        vc.foodData = arrtouse[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.count == 0 {
            searching = false
        } else {
            searching = true
            searchdata = arrtouse.filter( { $0.lowercased().hasPrefix(searchText.lowercased()) } )
        }
        
        mytable.reloadData()
    }

}
