//
//  RankingViewController.swift
//  Test
//
//  Created by tharueporn on 29/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//

import UIKit
class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var first_logo: UIImageView!
    @IBOutlet weak var first_rate: UILabel!
    @IBOutlet weak var first_receive: UILabel!
    
    var topthree_index = Int()
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topthreeofrankingcell", for: indexPath) as! CustomAllOfRankingTableViewCell
        cell.topthree_logo_bank.image = UIImage(named: (Global.logo_bank[indexPath.row + 1] + ".png"))
        cell.topthree_rate.text = String(format: "%.2f", Global.rateperyear[indexPath.row + 1])
        cell.topthree_receive.text = String(format: "%.2f", Global.receive_interest[indexPath.row + 1])
        cell.topthree_type_acc.text = String(Global.type_acc[indexPath.row + 1])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Global.index = indexPath.row + 1
        
        performSegue(withIdentifier: "TopThreetoShowDetails", sender: self)
    }
    
    // Show First of Topthree ranking
    override func viewDidLoad() {
        
        let set_rate_format = String(format: "%.2f", Global.rateperyear[0])
        let set_receive_format = String(format: "%.2f", Global.receive_interest[0])
        
        first_logo.image = UIImage(named: (Global.logo_bank[1] + ".png"))
        first_rate.text = set_rate_format + " %"
        first_receive.text = set_receive_format + " บาท"
    }
    
}
