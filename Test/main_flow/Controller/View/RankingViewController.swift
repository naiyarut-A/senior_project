//
//  RankingViewController.swift
//  Test
//
//  Created by tharueporn on 29/12/2561 BE.
//  Copyright © 2561 tharueporn. All rights reserved.
//

import UIKit



class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBOUTLET
    @IBOutlet weak var first_logo: UIImageView!
    @IBOutlet weak var first_rate: UILabel!
    @IBOutlet weak var first_receive: UILabel!
    
    //Variable
    var topthree_index = Int()
    

    // TABLE VIEW
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
       
        //SORT RATE
        let bank = Global.filterbank.sorted(){$0.rate > $1.rate}
        let banktoptwothree = bank[indexPath.row+1]
        
        //SORT receive
       // let bank = Global.receive_interest.sorted()
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "topthreeofrankingcell", for: indexPath) as! CustomAllOfRankingTableViewCell
        
        //SHOW DATA IN UI
        cell.topthree_logo_bank.image = UIImage(named: (banktoptwothree.img + ".png"))
        cell.topthree_rate.text = String(format: "%.2f", banktoptwothree.rate)
        cell.topthree_receive.text = String(format: "%.2f", Global.receive_interest[indexPath.row + 1])
        cell.topthree_type_acc.text = String(banktoptwothree.typedep)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Global.index = indexPath.row + 1
        
        performSegue(withIdentifier: "TopThreetoShowDetails", sender: self)
    }
    
    
    
    // Show First of Topthree ranking
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Global.filterbank.removeAll()
        Global.rateinbank.removeAll()
        
        Global.receive_interest.removeAll()
        Global.receive_af_interest.removeAll()
        
        
        for filter in Global.allbank {

            if (Global.periodvalue == filter.months) && (Global.amount_money >= Double(filter.openminacc) && (Global.type_deposit == filter.type))
            {
                Global.filterbank.append(filter)
                Global.rateinbank.append(filter.rate)
                
            }
            
        }
        
        UnitFunction.calculate_receive(amount: Global.amount_money, rateperyear: Global.rateinbank, period: Global.periodvalue)
        
        
        //SHOW DATA IN Top 1st
        
        //sorting
        let bank = Global.filterbank.sorted(){$0.rate > $1.rate}

        let bankoffirst = bank[0]
        
        //set format
        let set_rate_format = String(format: "%.2f", bankoffirst.rate)
        let set_receive_format = String(format: "%.2f", Global.receive_interest[0])
        
        //show data
        first_logo.image = UIImage(named: (bankoffirst.img + ".png"))
        first_rate.text = set_rate_format + " %"
        first_receive.text = set_receive_format + " บาท"
        

    }
    
}



