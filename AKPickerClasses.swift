//
//  AKPickerClasses.swift
//  AKPickerView
//
//  Created by Anupam Katiyar on 20/10/15.
//  Copyright © 2015 Anupam Katiyar. All rights reserved.
//

import Foundation

class AKDatePicker: UIDatePicker {
    
    internal typealias PickerDone = (date : NSDate) -> Void
    private var doneBlock : PickerDone!
    
    class func openPickerInTextField(textField: UITextField, currentDate: NSDate?, minimumDate: NSDate?, maximumDate: NSDate?, doneBlock: PickerDone) {

        let picker = AKDatePicker()
        picker.doneBlock = doneBlock
        picker.openPickerInTextField(textField, currentDate: currentDate, minimumDate: minimumDate, maximumData: maximumDate)
    
    }
    
    private func openPickerInTextField(textField: UITextField, currentDate: NSDate?, minimumDate: NSDate?, maximumData: NSDate?) {
        
        self.datePickerMode = UIDatePickerMode.Date
        
        self.maximumDate = maximumDate ?? NSDate()//NSDate(timeIntervalSinceNow: -1.577e+8)
        self.date = currentDate ?? NSDate()
        self.minimumDate = minimumDate ?? NSDate() //NSDate(timeIntervalSince1970: -1000000000)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "pickerDoneButtonTapped")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action:nil)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let array = [spaceButton, doneButton]
        toolbar.setItems(array, animated: true)
        toolbar.backgroundColor = UIColor.lightTextColor()
        
        textField.inputView = self
        textField.inputAccessoryView = toolbar
        
    }
    
    @IBAction private func pickerDoneButtonTapped(){
        
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
        self.doneBlock(date: self.date)
    }

}

//Installation
//        AKDatePicker.openPickerInTextField(UITextField(), currentDate: nil, minimumDate: nil, maximumDate: nil) { (date) -> Void in
//
//        }

