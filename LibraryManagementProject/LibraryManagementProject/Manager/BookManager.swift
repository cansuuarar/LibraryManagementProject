//
//  BookManager.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import Foundation

class BookManager {
    
    static let shared = BookManager()
    var books: [Book] = []
    
    private init() {}
}
