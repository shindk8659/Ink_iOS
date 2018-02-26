//
//  NewspeedTVC.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class ExampleCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
}

class NewspeedTVC: UITableViewController {
    
    var list = ["dmdkdkdkdkdkdsfasdfsadfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㄴㅁㄹㅇㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㅁㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ","asdfasdf","asdfasdfasdfasdfsfs"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath) as! ExampleCell
        cell.layer.cornerRadius = 8
        cell.detailsLabel.text = list[indexPath.row]
        return cell
    }
    
}


