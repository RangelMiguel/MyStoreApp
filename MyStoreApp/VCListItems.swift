//
//  VCListItems.swift
//  MyStoreApp
//
//  Created by user146960 on 4/2/19.
//  Copyright © 2019 Miguel. All rights reserved.
//

import UIKit
import CoreData

class VCListItems: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewItems: UITableView!
    
    var listOfItems = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        tableViewItems.delegate = self
        tableViewItems.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func loadItems(){
        let fetchRequest: NSFetchRequest<Items> = Items.fetchRequest()
        do{
            listOfItems = try context.fetch(fetchRequest)
        } catch {
            print("cannot load items")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! TVCItem
        cell.setItem(item: listOfItems[indexPath.row])
        return cell
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
