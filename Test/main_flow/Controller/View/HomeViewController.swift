//
//  HomeViewController.swift
//  Test
//
//  Created by tharueporn on 27/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//


import UIKit

var rateinbank = [Double]()


class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    
    let font = UIFont.systemFont(ofSize: 18)
   
    //Pass value to Ranking
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if segue.identifier == "calculate" {
            Global.amount_money = Double(amount.text!)!
            
            
            //Create Array rateinbank to keep data rate
            for arrRate in Global.allbank{
                rateinbank.append(arrRate.rate)
                
            }
            
            print(rateinbank)
            
            UnitFunction.calculate_receive(amount: Global.amount_money, rateperyear: rateinbank, period: Global.periodvalue)
            
            let nextViewController = segue.destination as? RankingViewController
            
          
        }
        
    }
    
    //Set change segmentcontrol
    @IBAction func indexChage(_ sender: AnyObject) {
        switch segment.selectedSegmentIndex {
        case 0:
            textlabel.text = "ฝากเงินก้อน"
            Global.type_deposit = "เงินก้อน"
        case 1:
            textlabel.text = "ฝากเงินรายเดือน"
            Global.type_deposit = "รายเดือน"
        default:
            break
            }
    }
    
    //Set PickerView
    let periods = ["3","6","9","12","24","36","48","60"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return periods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return periods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        Global.periodvalue = Int(periods[row])!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
      
        //Read JSON FILE 
        let newUrl = Bundle.main.url(forResource: "15012019", withExtension: "json")
        
        //check url
        guard let j = newUrl
            else{
                print("data not found")
                return
        }
        
        //check data in url
        guard let d = try? Data(contentsOf: j)
            else { print("failed")
                return
                
        }
        guard let rootJSON = try? JSONSerialization.jsonObject(with: d, options: [])
            else{ print("failedh")
                return
        }
        
        
        Global.ktbgeneral = UnitFunction.keepdata(category: "general", bank: "kasikorn", json: rootJSON, arraybank: Global.ktbgeneral)
        Global.scbgeneral = UnitFunction.keepdata(category: "general", bank: "scb", json: rootJSON, arraybank: Global.scbgeneral)
        Global.ktbspecial = UnitFunction.keepdata(category: "special", bank: "kasikorn", json: rootJSON, arraybank: Global.ktbspecial)
        Global.ktbspecial = UnitFunction.keepdata(category: "special", bank: "scb", json: rootJSON, arraybank: Global.ktbspecial)
        
        //Merge arrayallbank
        Global.allbank = Global.ktbgeneral + Global.scbgeneral + Global.ktbspecial + Global.scbspecial
        
        
    }
    
 
}


