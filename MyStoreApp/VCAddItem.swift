//
//  VCAddItem.swift
//  MyStoreApp
//
//  Created by user146960 on 4/2/19.
//  Copyright © 2019 Miguel. All rights reserved.
//

import UIKit
import CoreData
class VCAddItem: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{

    @IBOutlet weak var txtItemName: UITextField!
    @IBOutlet weak var ShowImage: UIImageView!
    @IBOutlet weak var StoresPickView: UIPickerView!
    
    var imagePicker:UIImagePickerController!
    var listOfStores = [StoreType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStores()
        StoresPickView.delegate = self
        StoresPickView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfStores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = listOfStores[row]
        return store.store_name
    }

    func loadStores(){
        let fetchRequest: NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do{
            listOfStores = try context.fetch(fetchRequest)
        } catch {
            print("cannot load stores")
        }
    }
    
    
    @IBAction func buSelectPicture(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ShowImage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func buSave(_ sender: Any) {
        let newItem = Items(context:context)
        newItem.item_name = txtItemName.text
        newItem.date_add = NSDate() as? Date
        newItem.image = ShowImage.image
        newItem.toStoreType = listOfStores[StoresPickView.selectedRow(inComponent: 0)]
        
        do{
            ad.saveContext()
            txtItemName.text = ""
        } catch {
            print("Error cannot save item")
        }
    }
    
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
