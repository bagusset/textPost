//
//  SaveDiaryVC.swift
//  textPost
//
//  Created by Bagus setiawan on 19/01/21.
//

import UIKit
import Firebase

class SaveDiaryVC: UIViewController {
    
    @IBOutlet weak var inputTittleTextField: UITextField!
    @IBOutlet weak var inputDateTextField: UITextField!
    @IBOutlet weak var inputNoteTextfield: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var dissmisBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
    }
    
    

}
