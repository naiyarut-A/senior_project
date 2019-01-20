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
    
    let cellReuseIdentifier = "allofrankingcell"
    let cellSpacingHeight: CGFloat = 5
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Global.filterbank.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Global.filterbank.count
        return 1
    }
    
    // set header's table
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "headercell")
//
//        return cell
        let  headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
        return cellSpacingHeight
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 45
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //SORT RATE
        let bank = Global.filterbank.sorted(){$0.rate > $1.rate}
//        let allofbank = bank[indexPath.row]
        let allofbank = bank[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allofrankingcell", for: indexPath) as! CustomAllOfRankingTableViewCell
        let set_rate_format = String(format: "%.2f", allofbank.rate)
//        let set_receive_format = String(format: "%.2f", Global.receive_interest[indexPath.row])
        
        let set_receive_format = String(format: "%.2f", Global.receive_interest[indexPath.section])

        cell.logo_bank.image = UIImage(named: (allofbank.img + ".png"))
        cell.type_acc.text = allofbank.typedep
        cell.rateperyear.text = String(set_rate_format)
        cell.receive_interest.text = String(set_receive_format)
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Global.index = indexPath.section
        
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
