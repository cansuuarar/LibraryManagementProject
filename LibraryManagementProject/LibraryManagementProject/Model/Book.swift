//
//  Book.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import Foundation

class Book : Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String
    var bookType: BookType
    var pageCount : Int
    var shelfLocation: String {
        return "\(name.first!) - \(pageCount)"
    }
   
    
    init(name: String, bookType: BookType, pageCount : Int) {
        self.name = name
        self.bookType = bookType
        self.pageCount = pageCount
    }
    
}
