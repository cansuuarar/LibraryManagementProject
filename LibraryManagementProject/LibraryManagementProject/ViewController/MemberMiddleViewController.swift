//
//  MemberMiddleViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 8.10.2024.
//

import UIKit

class MemberMiddleViewController: UIViewController {
    
    
    @IBOutlet weak var memberNameTextField: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func beMember(_ sender: UIButton) {
        let memberName = memberNameTextField.text ?? ""
        let member = Member(name: memberName)
        MemberManager.shared.members.append(member)

        memberNameTextField.text = ""
    }

}
