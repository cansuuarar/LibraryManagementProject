//
//  MemberManager.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 8.10.2024.
//

import Foundation

class MemberManager {
    
    static let shared = MemberManager()
    var members: [Member] = []
    
    private init() {}
}
