//
//  ViewController.swift
//  namePicker
//
//  Created by Charlotte Abrams on 9/14/16.
//  Copyright © 2016 Charlotte Abrams. All rights reserved.
//

import UIKit
import CoreData

class NamesViewController: UITableViewController, CancelButtonDelegate, FirstNameDoneControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var firstNamePicker: UIPickerView!
    
    
    var names = [Name]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row].firstName!
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
//    {
//        return names[row].firstName!
//    }
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> Name! {
//        return "wup uwpw upw"
////        return names[row]
//    }
    
    func firstNameViewController(controller: FirstNameViewController, didFinishAddingFirstName name: String) {
        dismissViewControllerAnimated(true, completion: nil)
        var name = NSEntityDescription.insertNewObjectForEntityForName("Name", inManagedObjectContext: managedObjectContext) as! Name
        name.firstName = controller.firstNameTextField.text
        names.append(name)
        print("**************", names, "*****************")
        firstNamePicker.reloadAllComponents()
    }
    
    func fetchAllNames() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddFirstName" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! FirstNameViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNamePicker.dataSource = self
        firstNamePicker.reloadAllComponents()
//        firstNamePicker.delegate = self
        let nameRequest = NSFetchRequest(entityName: "Name")
        do {
            let results = try managedObjectContext.executeFetchRequest(nameRequest)
            names = results as! [Name]
        } catch {
            print("\(error)")
        }
        fetchAllNames()
        super.viewDidLoad()
//        let name = NSEntityDescription.insertNewObjectForEntityForName("Name", inManagedObjectContext: managedObjectContext) as! Name
//        name.firstName = "Charlotte"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

