//
//  ViewController.swift
//  MyStoreApp
//
//  Created by user146960 on 4/1/19.
//  Copyright © 2019 Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtStoreName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buAddStore(_ sender: Any) {
        let newStore = StoreType(context: context)
        newStore.store_name = txtStoreName.text
        
        do {
            ad.saveContext()
            txtStoreName.text = ""
        } catch {
            print("Cannot save record")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

