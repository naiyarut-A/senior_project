//
//  AllOfRankingViewController.swift
//  Test
//
//  Created by naiyarut on 3/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

import UIKit

class AllOfRankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let logo_bank = ["ksone", "scb30","ksone"]
    let type_acc = ["ทั่วไป", "พิเศษ","เพื่อลูก"]
    let rateperyear = [2.45, 2.05 ,1.56]
    let receive_interest = [385.54, 375.20,360.45]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logo_bank.count
    }
    
    // set header's table
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "headercell")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allofrankingcell", for: indexPath) as! CustomAllOfRankingTableViewCell
        
        cell.logo_bank.image = UIImage(named: (logo_bank[indexPath.row] + ".png"))
        cell.type_acc.text = type_acc[indexPath.row]
        cell.rateperyear.text = String(rateperyear[indexPath.row])
        cell.receive_interest.text = String(receive_interest[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
