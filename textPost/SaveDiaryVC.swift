//
//  SaveDiaryVC.swift
//  textPost
//
//  Created by Bagus setiawan on 19/01/21.
//

import UIKit
import Firebase

class SaveDiaryVC: UIViewController {
    
    var ref : DatabaseReference!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var inputTittleTextField: UITextField!
    @IBOutlet weak var inputDateTextField: UITextField!
    @IBOutlet weak var inputNoteTextfield: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var dissmisBtn: UIButton!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        createDatePicker()

    }
    
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        ref?.child("Notes").childByAutoId().setValue([ "Dates" : inputDateTextField.text, "Note" : inputNoteTextfield.text, "Titles" : inputTittleTextField.text])
        
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        inputDateTextField.inputAccessoryView = toolbar
        
        inputDateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        inputDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    

}
