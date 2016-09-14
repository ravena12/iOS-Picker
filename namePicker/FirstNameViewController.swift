//
//  FirstNameViewController.swift
//  namePicker
//
//  Created by Charlotte Abrams on 9/14/16.
//  Copyright © 2016 Charlotte Abrams. All rights reserved.
//

import UIKit

class FirstNameViewController: UITableViewController {
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        let name = firstNameTextField.text!
        delegate?.firstNameViewController(self, didFinishAddingFirstName: name)
    }
    @IBOutlet weak var firstNameTextField: UITextField!
    weak var delegate: FirstNameDoneControllerDelegate?
    weak var cancelButtonDelegate: CancelButtonDelegate?
}
