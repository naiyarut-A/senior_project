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
        
        let dayperyear = 365.00
        // part of 100%
        let multiple_percent = 0.01
        // tax 15%
        let rm_tax = 15
        
        
        for item in rateperyear {

            let cal_rate = Double(item * multiple_percent)
            print("cal_rate: ", cal_rate)


            let rateperday = Double(daypermonth*period)/dayperyear
            print("rate/day: ", rateperday)

            let result = Double(amount) * cal_rate * rateperday
            print("result: ", result)
            
            Global.receive_interest.append(result)

            //calculate tax
            let percent_remove_tax = 100 - rm_tax
            print("percent tax: ", percent_remove_tax)
            let cal_tax =  Double(percent_remove_tax) * multiple_percent
            print("tax to dec: ", cal_tax)
            //calculate after remove tax
            let af_rm_tax_result = result * cal_tax
            print("af rm tax: ", af_rm_tax_result)
            Global.receive_af_interest.append(af_rm_tax_result)
            
        }
        
        // sort desc of receive_interest array and receive_af_interest array
        Global.receive_interest.sort(by: >)
        Global.receive_af_interest.sort(by: >)
        
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
                    
                        return arraybank
                    }
                }
            }
            
        }
        
        return arraybank
    }
    
}
