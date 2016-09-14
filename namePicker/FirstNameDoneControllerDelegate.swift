//
//  FirstNameDoneControllerDelegate.swift
//  namePicker
//
//  Created by Charlotte Abrams on 9/14/16.
//  Copyright © 2016 Charlotte Abrams. All rights reserved.
//

import Foundation
protocol FirstNameDoneControllerDelegate: class {
    func firstNameViewController(controller: FirstNameViewController, didFinishAddingFirstName name: String)
}
