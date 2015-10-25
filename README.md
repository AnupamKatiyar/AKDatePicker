# AKDatePicker

# **Installation:**

func openPickerInTextField(textField: UITextField, currentDate: NSDate?, minimumDate: NSDate?, maximumDate: NSDate?, doneBlock: PickerDone)



# **Usage:**

 func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField == birthdayTextField {
            AKDatePicker.openPickerInTextField(UITextField(), currentDate: nil, minimumDate: nil, maximumDate: nil) { (date) ->                   Void in
                  print(date)
            }
      }        
 }
