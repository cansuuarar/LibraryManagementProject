//
//  MemberMiddleViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 8.10.2024.
//

import UIKit

final class MemberMiddleViewController: UIViewController {

    @IBOutlet private weak var memberNameTextField: UITextField!
 
    @IBAction private func beMember(_ sender: UIButton) {
        let memberName = memberNameTextField.text ?? ""
        let member = Member(name: memberName)
        MemberManager.shared.members.append(member)

        memberNameTextField.text = ""
    }
}
