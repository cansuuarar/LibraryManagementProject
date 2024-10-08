//
//  Member.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import Foundation

final class Member : Equatable {
    // MARK: properties
    private(set) var name: String
    private(set) var books: [Book] = []
    
    // MARK: initializers
    init(name: String) {
        self.name = name
    }
    
    // MARK: functions
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.name == rhs.name
    }
}
