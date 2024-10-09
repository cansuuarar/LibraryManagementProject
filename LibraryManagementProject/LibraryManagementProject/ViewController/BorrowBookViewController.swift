//
//  BorrowBookViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 8.10.2024.
//

import UIKit

class BorrowBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var memberNameTextField: UITextField!
    @IBOutlet weak var borrowBookTableView: UITableView!
    
    var selectedBooks: [Book] = []
    var limit = 2
   
    override func viewDidLoad() {
        super.viewDidLoad()
        borrowBookTableView.dataSource = self
        borrowBookTableView.delegate = self
        
        borrowBookTableView.allowsMultipleSelection = true
    }

    @IBAction func borrowBookButton(_ sender: UIButton) {
        if memberNameTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Warning", message:
                                                        "member name cannot be empty!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            }))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            for member in MemberManager.shared.members {
                if member.name == memberNameTextField.text {
                    for book in selectedBooks {
                        member.books.append(book)
                    }
                }
            }
        }

        memberNameTextField.text = ""
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookManager.shared.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = borrowBookTableView.dequeueReusableCell(withIdentifier: "borrowCell", for: indexPath)
        cell.textLabel?.text = BookManager.shared.books[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = BookManager.shared.books[indexPath.row]
        selectedBooks.append(selectedBook)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deSelectedBook = BookManager.shared.books[indexPath.row]
        if let index = selectedBooks.firstIndex(of: deSelectedBook) {
            selectedBooks.remove(at: index)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let sr = borrowBookTableView.indexPathsForSelectedRows {
                    if sr.count == limit {
                        let alertController = UIAlertController(title: "Warning", message:
                                                                    "You are limited to \(limit) selections", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                        }))
                        self.present(alertController, animated: true, completion: nil)
                        
                        return nil
                    }
                }
                
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }

    
}


/*
  
 if let, guard let: optional değerleri güvenli bir şekilde unwrap etmek için kullanılır.
 
 if let:bir optional değerin nil olup olmadığını kontrol eder ve nil değilse bu değer kullanılır.
 if let constantName = optionalValue {
 optionalValue nil değilse bu blok çalışır, constant name burada kullanılabilir
 } else {
    optionalValue nil ise bu blok çalışır, opsiyonel.
 }
 
 guard let: bir optional değerin nil olup olmadığını kontrol eder ve eğer nil ise mevcut akışı terk eder.
 guard let constantName = optionalVlue else {
    optional balue nil ise bu blok çalışır
 return
 }
 optionalValue nil değilse buradan sonra çalışır, constantName kullanılabilir.
 
 
 */
