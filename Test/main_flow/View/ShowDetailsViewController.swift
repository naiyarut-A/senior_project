//
//  ShowDetailsViewController.swift
//  Test
//
//  Created by naiyarut on 12/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var showdetails_name_acc: UILabel!
    @IBOutlet weak var showdetails_logo: UIImageView!
    @IBOutlet weak var showdetails_amount: UILabel!
    @IBOutlet weak var showdetails_period: UILabel!
    @IBOutlet weak var showdetails_rate: UILabel!
    @IBOutlet weak var showdetails_bf_receive: UILabel!
    @IBOutlet weak var showdetails_af_receive: UILabel!
    @IBOutlet weak var showdetails_min_amount: UILabel!
    @IBOutlet weak var showdetails_min_age: UILabel!
    @IBOutlet weak var showdetails_pay_condition: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showdetails_name_acc.text = String("บัญชีเงินฝากประจำแบบ" + Global.type_acc[Global.index])
        showdetails_logo.image = UIImage(named: (Global.logo_bank[Global.index] + ".png"))
        showdetails_amount.text = String(UnitFunction.set_two_decimal(value: Global.amount_money)) + " บาท"
        showdetails_period.text = String(Global.periodvalue) + " เดือน"
        showdetails_rate.text = String(UnitFunction.set_two_decimal(value: Global.rateperyear[Global.index])) + " %"
        showdetails_bf_receive.text = String(UnitFunction.set_two_decimal(value: Global.receive_interest[Global.index])) + " บาท"
        showdetails_af_receive.text = String(UnitFunction.set_two_decimal(value: Global.receive_af_interest[Global.index])) + " บาท"
        showdetails_min_amount.text = String(Global.min_amount[Global.index]) + " บาท"
        showdetails_min_age.text = String(Global.min_age[Global.index]) + " ปี"
        showdetails_pay_condition.text = String(Global.condition_pay[0])

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
