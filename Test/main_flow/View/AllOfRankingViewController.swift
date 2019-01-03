//
//  AllOfRankingViewController.swift
//  Test
//
//  Created by naiyarut on 3/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

import UIKit

class AllOfRankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let logo_bank = ["home_n", "fev"]
    let type_acc = ["A", "B"]
    let rateperyear = [1, 2]
    let receive_interest = [1.1, 2.2]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logo_bank.count
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
