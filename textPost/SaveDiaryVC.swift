//
//  SaveDiaryVC.swift
//  textPost
//
//  Created by Bagus setiawan on 19/01/21.
//

import UIKit
import Firebase

class SaveDiaryVC: UIViewController, UITextViewDelegate {
    
    var ref : DatabaseReference!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var inputTittleTextField: UITextField!
    @IBOutlet weak var inputDateTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var dissmisBtn: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        createDatePicker()
        configureUITextView()
        configureBtn()
        noteTextView.delegate = self

        

    }
    
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        ref?.child("Notes").childByAutoId().setValue([ "Dates" : inputDateTextField.text, "Note" : noteTextView.text, "Titles" : inputTittleTextField.text])
        
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
    
    func configureUITextView(){

        noteTextView.text = "Write your note today !"
        noteTextView.textColor = UIColor.lightGray

        self.noteTextView.layer.borderWidth = 1.0
        self.noteTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.noteTextView.layer.cornerRadius = 10
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if noteTextView.textColor == UIColor.lightGray{
            noteTextView.text = nil
            noteTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if noteTextView.text.isEmpty {
            noteTextView.text = "Write your note today !"
            noteTextView.textColor = UIColor.lightGray
        }
    }
    
    func configureBtn(){
        saveBtn.backgroundColor = #colorLiteral(red: 0, green: 0.886972487, blue: 0.1316010654, alpha: 1)
        saveBtn.layer.cornerRadius = 10
        saveBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        dissmisBtn.tintColor = #colorLiteral(red: 0.007044891827, green: 0.885907352, blue: 0.1369796097, alpha: 1)
    }

}
