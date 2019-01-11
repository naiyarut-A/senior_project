//
//  HomeViewController.swift
//  Test
//
//  Created by tharueporn on 27/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//


import UIKit
class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
//    let logo_bank = ["ksone", "scb30","ksone"]
//    let type_acc = ["ทั่วไป", "พิเศษ","เพื่อลูก"]
//    let rateperyear = [2.45, 2.05 ,1.56]
//    let receive_interest = [385.54, 375.20,360.45]
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    
    let font = UIFont.systemFont(ofSize: 18)
    
//    var type_deposit = Int()
//    var periodvalue = Int()
//    var amount_money = Double()
    
    //Pass value to Ranking
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //        print("type_dept: \(type_deposit)")
        //        print("=============================================")
        //        print("period: \(periodvalue)")
        
        if segue.identifier == "calculate" {
            Global.amount_money = Double(amount.text!)!
            
            UnitFunction.calculate_receive(amount: Global.amount_money, rateperyear: Global.rateperyear)
            
            let nextViewController = segue.destination as? RankingViewController

            
            print(Global.receive_interest)
            
        }
        
    }
    
    //Set change segmentcontrol
    @IBAction func indexChage(_ sender: AnyObject) {
        switch segment.selectedSegmentIndex {
        case 0:
            textlabel.text = "ฝากเงินก้อน"
            Global.type_deposit = 0
        case 1:
            textlabel.text = "ฝากเงินรายเดือน"
            Global.type_deposit = 1
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
    }
    
    
}


