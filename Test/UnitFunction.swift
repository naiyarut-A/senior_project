//
//  File.swift
//  Test
//
//  Created by naiyarut on 11/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

class UnitFunction {
    static func calculate_receive(amount: Double, rateperyear: [Double]) {
        for item in rateperyear {
            let result = amount * item
            Global.receive_interest.append(result)
        }
        
    }
    
}
