//
//  Global.swift
//  Test
//
//  Created by naiyarut on 11/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

class Global {
    
    static var type_deposit = "เงินก้อน"
    static var periodvalue = 3
    static var amount_money = Double()
    
    static var rateinbank = [Double]()  // keep rate from filter
    
    //array for keep interest value (map with rate in rateinbank array)
    static var receive_interest = [Double]()
    static var receive_af_interest = [Double]()
    
    static var index = Int()

    //Keep Array
    //====================================== general =======================================
    static  var thaicredit_general = [BankDetails]()
    static  var tmb_general = [BankDetails]()
    static  var bangkok_general = [BankDetails]()
    static  var lhbank_general = [BankDetails]()
    static  var ktb_general = [BankDetails]()
    static  var kasikorn_general = [BankDetails]()
    static  var baac_general = [BankDetails]()
    static  var tisco_general = [BankDetails]()
    static  var icbc_general = [BankDetails]()

    //====================================== special =======================================
    static  var thaicredit_special = [BankDetails]()
    static  var kasikorn_special = [BankDetails]()
    static  var tisco_special = [BankDetails]()
    
    //====================================== free-tax =======================================
    static  var thaicredit_freetax = [BankDetails]()
    static  var tmb_freetax = [BankDetails]()
    static  var bangkok_freetax = [BankDetails]()
    static  var lhbank_freetax = [BankDetails]()
    static  var ktb_freetax = [BankDetails]()
    static  var kasikorn_freetax = [BankDetails]()
    static  var tisco_freetax = [BankDetails]()
    static  var icbc_freetax = [BankDetails]()

    //====================================== other ==========================================
    static  var thaicredit_other = [BankDetails]()
    static  var bangkok_other = [BankDetails]()
    static  var kasikorn_other = [BankDetails]()

    static  var filterbank = [BankDetails]()
    static  var allbank    = [BankDetails]()
    
   
  
}

struct BankDetails {
  
    
    var interestpay: String
    var months: Int
    var name: String
    var openminacc: Int
    var rate: Double
    var type: String
    var typedep: String
    var minage: String
    var idcard: String
    var img: String
    var url: String
    var rateback: Array<Any>
    init(_ dictionary: [String: Any]) {
        
        self.interestpay = dictionary["interestpay"] as? String ?? "NA"
        self.months = dictionary["months"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? "NA"
        self.openminacc = dictionary["openminacc"] as? Int ?? 0
        self.rate = dictionary["rate"] as? Double ?? 0.0
        self.type = dictionary["type"] as? String ?? "NA"
        self.typedep = dictionary["typedep"] as? String ?? "NA"
        self.minage = dictionary["minage"] as? String ?? "NA"
        self.idcard = dictionary["idcard"] as? String ?? "NA"
        self.img = dictionary["img"] as? String ?? "NA"
        self.url = dictionary["url"] as? String ?? "NA"
        self.rateback =  dictionary["rateback"] as? Array ?? []
    }
    
    
}
