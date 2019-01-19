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
    
    @IBAction func showdetails_linktowebsite(_ sender: Any) {
        let bank = Global.filterbank.sorted{$0.rate > $1.rate}
        let showofbank = bank[Global.index]
        UIApplication.shared.open(URL(string: showofbank.url)!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bank = Global.filterbank.sorted{$0.rate > $1.rate}
        let showofbank = bank[Global.index]
        
        //Do any additional setup after loading the view.
        showdetails_name_acc.text = String(showofbank.name)
        showdetails_logo.image = UIImage(named: (showofbank.img + ".png"))
        showdetails_amount.text = String(UnitFunction.set_two_decimal(value: Global.amount_money)) + " บาท"
        showdetails_period.text = String(Global.periodvalue) + " เดือน"
        showdetails_rate.text = String(UnitFunction.set_two_decimal(value: showofbank.rate)) + " %"
        showdetails_bf_receive.text = String(UnitFunction.set_two_decimal(value: Global.receive_interest[Global.index])) + " บาท"
        showdetails_af_receive.text = String(UnitFunction.set_two_decimal(value: Global.receive_af_interest[Global.index])) + " บาท"
        showdetails_min_amount.text = String(showofbank.openminacc) + " บาท"
        showdetails_min_age.text = String(showofbank.minage) + " ปีขึ้นไป"
        showdetails_pay_condition.text = String(showofbank.interestpay)
        
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
