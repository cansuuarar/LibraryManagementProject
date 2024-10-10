//
//  BookTableViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import UIKit

final class BookTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet private weak var bookTableView: UITableView!
    
    private var bookName: String?
    private var bookType: String?
    private var pageCount: Int?
    private var shelfLocation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTableView.delegate = self
        bookTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BookManager.shared.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookTableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        let element = BookManager.shared.books[indexPath.row]
        
        cell.bookName.text = element.name
        cell.bookType.text = element.bookType.rawValue
        cell.pageCount.text = String(element.pageCount)
        cell.shelfLocation.text = element.shelfLocation
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148 // Örneğin sabit bir yükseklik.
    }
}
