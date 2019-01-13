//
//  AllOfRankingViewController.swift
//  Test
//
//  Created by naiyarut on 3/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

import UIKit

class AllOfRankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var allrank_index = Int()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.logo_bank.count
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
        
        let set_rate_format = String(format: "%.2f", Global.rateperyear[indexPath.row])
        let set_receive_format = String(format: "%.2f", Global.receive_interest[indexPath.row])
        
        cell.logo_bank.image = UIImage(named: (Global.logo_bank[indexPath.row] + ".png"))
        cell.type_acc.text = Global.type_acc[indexPath.row]
        cell.rateperyear.text = String(set_rate_format)
        cell.receive_interest.text = String(set_receive_format)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Global.index = indexPath.row
        
        performSegue(withIdentifier: "AllRanktoShowDetails", sender: self)
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
