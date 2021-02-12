//
//  File.swift
//  Test
//
//  Created by naiyarut on 11/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//
import  Foundation
class UnitFunction {
    
    static func calculate_receive(amount: Double, rateperyear: [Double], period: Int) {
        
        let daypermonth = 30
        
        let dayperyear = 365
        // part of 100%
        let multiple_percent = 0.01
        // tax 15%
        let rm_tax = 15
        
        var sort_receive_af_interrest = [Double]()
        var sort_receive_interrest = [Double]()
        
        for item in rateperyear {
            
            //calculate before remove tax
            print("rate", item)
            let cal_rate = item * multiple_percent
            print("Cal rate: ", cal_rate)
            
            let rateperday = (Double(daypermonth)*Double(period))/Double(dayperyear)
            print("period: ",period)
            print("Rate per day: ",rateperday)
            
            let result = amount * cal_rate
            print("Result: ", result)
            
            //Global.receive_interest.append(receive)
            sort_receive_interrest.append(result)
           
            
            //calculate tax
            let percent_remove_tax = 100 - rm_tax
            let  cal_tax_to_decimal =  Double(percent_remove_tax)*multiple_percent
            
            //calculate after remove tax
        
            let af_rm_tax_result = result * cal_tax_to_decimal
            sort_receive_af_interrest.append(af_rm_tax_result)
           
        }
        
        //Before Tax
        Global.receive_interest = sort_receive_interrest.sorted{$0 > $1}
        print(Global.receive_interest)
        
        //After Tax
        Global.receive_af_interest = sort_receive_af_interrest.sorted{$0 > $1}
        print(Global.receive_af_interest)
       
    }
    
    static func set_two_decimal(value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    
   static func keepdata(category: String,bank: String,json: Any,arraybank: [BankDetails]) -> [BankDetails] {
        
        if let JSON = json as? [String: Any] {
            if let Array = JSON[category] as? NSArray{
                if let array = Array[0] as? NSObject {
                    if let data = array.value(forKey: bank) as? NSArray
                    {
                        let arraybank = data.compactMap{return BankDetails($0 as! [String : Any])}
                    
                        //print("Ktb",ktbgeneral)
                        print("Success to create arraybank")
                        return arraybank
                    }
                }
            }
            
        }
        
        return arraybank
    }
    
}
