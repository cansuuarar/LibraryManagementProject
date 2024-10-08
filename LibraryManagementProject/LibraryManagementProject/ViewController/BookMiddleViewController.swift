//
//  BookMiddleViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import UIKit

class BookMiddleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var bookTypesPickerView: UIPickerView!
    @IBOutlet weak var pageCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTypesPickerView.delegate = self
        bookTypesPickerView.dataSource = self
        bookTypesPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        bookNameTextField.delegate = self
        pageCountTextField.delegate = self
    }
    
    //picker view'in kaç bileşeni(sutun) olduğunu belirler, dataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //her bir bileşende(sutunda) kaç satır olduğunu belirler, dataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BookType.allCases.count
    }
    //her satırda gösterilecek metni belirler, delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BookType.allCases[row].rawValue
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //harfleri içeren character seti oluşturlur
        //CharacterSet.letters: harf karakterleri a-z A-Z
        //CharacterSet(charactersIn: string): girilen karakterler
        if textField == bookNameTextField {
            let allowedCharacters = CharacterSet.letters.union(.whitespaces)
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) //girilen karakterlerin sadece harf olup olmadığı kontrol edilir, eğer false dönerse karakter girişine izin verilmez
        }
        else if textField == pageCountTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        return true // diğer tüm durumlar için metin değiştirlmesine izin veriyoruz
    }
    
    @IBAction func addBook(_ sender: UIButton) {
        let bookName = bookNameTextField.text ?? ""
        let bookTypeIndex = bookTypesPickerView.selectedRow(inComponent: 0)
        let pageCount = Int(pageCountTextField.text ?? "") ?? 0

        let book = Book(name: bookName, bookType: BookType(rawValue: bookTypeIndex.description) ?? .NOVEL , pageCount: pageCount)
        
        BookManager.shared.books.append(book)
        
        bookNameTextField.text = ""
        pageCountTextField.text = ""
    }
    
    
}
