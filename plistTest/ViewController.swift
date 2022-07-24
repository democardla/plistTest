//
//  ViewController.swift
//  plistTest
//
//  Created by DemoCardla on 2022/7/24.
//

import UIKit

class ViewController: UIViewController {

//    var AddressArr = [[String: AnyObject]]()
//    var ProvinceIndex = 0
//    var Province = ""
//    var CityIndex = 0
//    var City = ""
//    var AreaIndex = 0
//    var Area = ""
    
    
    var Menu = [String: Array<String>]()
    var menuClasses = [String]()
    var itemKey:String {
        return menuClasses[]
    }
    
    @IBOutlet weak var CountryPicker: UIPickerView!
    
    func setup() {
        
        CountryPicker.delegate = self
        CountryPicker.dataSource = self
        
    }
    func linkToResource() {
        let path = Bundle.main.path(forResource: "Menu", ofType: ".plist")
        self.Menu = NSDictionary(contentsOfFile: path!)! as! Dictionary
        self.menuClasses = Array(Menu.keys)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        linkToResource()
        
        
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return menuClasses.count
        } else {
            let kinds = Menu[itemKey]!.count
            return kinds
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            self.itemKey = Array(Menu.keys)[row]
            return itemKey
        } else {
//            let item = Menu[itemKey]
            return Menu[itemKey]![row]
        }
    }
    
}



//extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 3
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return AddressArr.count
//        } else if component == 1 {
//            let Province = AddressArr[ProvinceIndex]
//            let array = Province[self.Province]!
//            return Province[self.Province]!.count
//        } else if component == 2 {
//            let Province = AddressArr[ProvinceIndex]
//            let city = Province[self.City]! as! Array<Any>
//            let City = city[CityIndex] as! Dictionary<String, Any>
//            let Area = City[self.Area]! as! Array<Any>
//            return Area.count
//        }
//    }
//
//
//}



//extension ViewController{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pies.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let row = indexPath.row
//        if isColorInverted{
//            cell.backgroundColor = color1
//            cell.textLabel?.textColor = color2
//        } else {
//            cell.backgroundColor = color2
//            cell.textLabel?.textColor = color1
//        }
//        return cell
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "pies"
//
//    }
//
//}



