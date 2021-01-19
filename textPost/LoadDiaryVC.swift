//
//  LoadDiaryVC.swift
//  textPost
//
//  Created by Bagus setiawan on 19/01/21.
//

import UIKit
import Firebase

class LoadDiaryVC: UIViewController {
  
    @IBOutlet weak var loadTableView: UITableView!
    
    var ref : DatabaseReference!
    
    var postData = [eventStruct]()
    
    struct eventStruct {
            let title: String!
            let date: String!
            let note: String!
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTableView.delegate = self
        loadTableView.dataSource = self
        
        loadData()
        
    }
    
    func loadData() {
        ref = Database.database().reference()
        ref.child("Notes").queryOrderedByKey().observe(.childAdded, with: { (DataSnapshot) in
            if let valueDictionary  = DataSnapshot.value as? [AnyHashable: String]
            {
                let title = valueDictionary["Titles"]
                let date  = valueDictionary["Dates"]
                let note = valueDictionary["Note"]
                self.postData.insert(eventStruct(title: title, date: date, note: note), at: 0)
                self.loadTableView.reloadData()
            }
        })
        
    }
 

}

extension LoadDiaryVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! LoadTableViewCell
        cell.titleLabel.text = postData[indexPath.row].title
        cell.dateLabel.text  = postData[indexPath.row].date
        cell.noteLabel.text = postData[indexPath.row].note
        
        return cell
        
    }
    
    
}
