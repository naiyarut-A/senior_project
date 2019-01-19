//
//  HomeViewController.swift
//  Test
//
//  Created by tharueporn on 27/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//


import UIKit


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
        let newUrl = Bundle.main.url(forResource: "forRead", withExtension: "json")
        
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
        
        //===================== general data ==================================
        Global.thaicredit_general = UnitFunction.keepdata(category: "general", bank: "thaicredit", json: rootJSON, arraybank: Global.thaicredit_general)
        Global.tmb_general = UnitFunction.keepdata(category: "general", bank: "tmb", json: rootJSON, arraybank: Global.tmb_general)
        Global.bangkok_general = UnitFunction.keepdata(category: "general", bank: "bangkok", json: rootJSON, arraybank: Global.bangkok_general)
        Global.lhbank_general = UnitFunction.keepdata(category: "general", bank: "lhbank", json: rootJSON, arraybank: Global.lhbank_general)
        Global.ktb_general = UnitFunction.keepdata(category: "general", bank: "ktb", json: rootJSON, arraybank: Global.ktb_general)
        Global.kasikorn_general = UnitFunction.keepdata(category: "general", bank: "kasikorn", json: rootJSON, arraybank: Global.kasikorn_general)
        Global.baac_general = UnitFunction.keepdata(category: "general", bank: "baac", json: rootJSON, arraybank: Global.baac_general)
        Global.tisco_general = UnitFunction.keepdata(category: "general", bank: "tisco", json: rootJSON, arraybank: Global.tisco_general)
        Global.icbc_general = UnitFunction.keepdata(category: "general", bank: "icbc", json: rootJSON, arraybank: Global.icbc_general)

        //===================== special data ==================================

        Global.thaicredit_special = UnitFunction.keepdata(category: "special", bank: "thaicredit", json: rootJSON, arraybank: Global.thaicredit_special)
        Global.kasikorn_special = UnitFunction.keepdata(category: "special", bank: "kasikorn", json: rootJSON, arraybank: Global.kasikorn_special)
        Global.tisco_special = UnitFunction.keepdata(category: "special", bank: "tisco", json: rootJSON, arraybank: Global.tisco_special)
        
        //===================== free-tax data ==================================
        Global.thaicredit_freetax = UnitFunction.keepdata(category: "free-tax", bank: "thaicredit", json: rootJSON, arraybank: Global.thaicredit_freetax)
        Global.tmb_freetax = UnitFunction.keepdata(category: "free-tax", bank: "tmb", json: rootJSON, arraybank: Global.tmb_freetax)
        Global.bangkok_freetax = UnitFunction.keepdata(category: "free-tax", bank: "bangkok", json: rootJSON, arraybank: Global.bangkok_freetax)
        Global.lhbank_freetax = UnitFunction.keepdata(category: "free-tax", bank: "lhbank", json: rootJSON, arraybank: Global.lhbank_freetax)
        Global.ktb_freetax = UnitFunction.keepdata(category: "free-tax", bank: "ktb", json: rootJSON, arraybank: Global.ktb_freetax)
        Global.kasikorn_freetax = UnitFunction.keepdata(category: "free-tax", bank: "kasikorn", json: rootJSON, arraybank: Global.kasikorn_freetax)
        Global.tisco_freetax = UnitFunction.keepdata(category: "free-tax", bank: "tisco", json: rootJSON, arraybank: Global.tisco_freetax)
        Global.icbc_freetax = UnitFunction.keepdata(category: "free-tax", bank: "icbc", json: rootJSON, arraybank: Global.icbc_freetax)
        
        //===================== other data ==================================
        Global.thaicredit_other = UnitFunction.keepdata(category: "other", bank: "thaicredit", json: rootJSON, arraybank: Global.thaicredit_other)
        Global.bangkok_other = UnitFunction.keepdata(category: "other", bank: "bangkok", json: rootJSON, arraybank: Global.bangkok_other)
        Global.kasikorn_other = UnitFunction.keepdata(category: "other", bank: "kasikorn", json: rootJSON, arraybank: Global.kasikorn_other)
        
        //Merge arrayallbank
        Global.allbank = Global.thaicredit_general + Global.tmb_general + Global.bangkok_general + Global.lhbank_general + Global.ktb_general + Global.kasikorn_general + Global.baac_general + Global.tisco_general + Global.icbc_general + Global.thaicredit_special + Global.kasikorn_special + Global.tisco_special + Global.thaicredit_freetax + Global.tmb_freetax + Global.bangkok_freetax + Global.lhbank_freetax + Global.ktb_freetax + Global.kasikorn_freetax + Global.tisco_freetax + Global.icbc_freetax + Global.thaicredit_other + Global.bangkok_other + Global.kasikorn_other
        
        
    }
    
 
}


