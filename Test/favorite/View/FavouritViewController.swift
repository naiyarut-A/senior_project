//
//  FavouritViewController.swift
//  Test
//
//  Created by tharueporn on 27/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//

import UIKit
class FavouritViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let logo_bank = ["ksone", "scb30","ksone"]
    let type_acc = ["ทั่วไป", "พิเศษ","เพื่อลูก"]
    let rateperyear = [2.45, 2.05 ,1.56]
    let receive_interest = [385.54, 375.20,360.45]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logo_bank.count
    }
    
    //set header's table
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alreadyfav", for: indexPath) as! CustomFavoriteTableViewCell
        
        cell.logo_bank.image = UIImage(named: (logo_bank[indexPath.row] + ".png"))
        cell.type_acc.text = type_acc[indexPath.row]
        cell.rateperyear.text = String(rateperyear[indexPath.row])
        cell.receive_interest.text = String(receive_interest[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
