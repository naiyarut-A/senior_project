//
//  File.swift
//  Test
//
//  Created by naiyarut on 11/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

class UnitFunction {
    
    static func calculate_receive(amount: Double, rateperyear: [Double], period: Int) {
        
        let dayperyear = 365
        // part of 100%
        let multiple_percent = 0.01
        // tax 15%
        let rm_tax = 15
        
        
        for item in rateperyear {
            
            //calculate before remove tax
            let cal_rate = item * multiple_percent
            print("Cal rate: ", cal_rate)
            
            let result = amount * cal_rate
            print("Result: ", result)
            
            let receive = (result * Double(period))/Double(dayperyear)
            print("period: ", period)
            print("Receive: ", receive)
            
            Global.receive_interest.append(receive)
            
            
            //calculate after remove tax
            let percent_tax = Double(rm_tax) * multiple_percent
            let af_result = receive - percent_tax
            Global.receive_af_interest.append(af_result)
        }
    }
    
    static func set_two_decimal(value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
}
