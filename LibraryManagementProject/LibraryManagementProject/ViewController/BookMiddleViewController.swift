//
//  BookMiddleViewController.swift
//  LibraryManagementProject
//
//  Created by CANSU ARAR on 7.10.2024.
//

import UIKit

final class BookMiddleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet private weak var bookNameTextField: UITextField!
    @IBOutlet private weak var bookTypesPickerView: UIPickerView!
    @IBOutlet private weak var pageCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTypesPickerView.delegate = self //
        bookTypesPickerView.dataSource = self
        bookTypesPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        bookNameTextField.delegate = self
        pageCountTextField.delegate = self
    }
    
    //picker view'in kaç bileşeni(sutun) olduğunu belirler, dataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
    }
    //her bir bileşende(sutunda) kaç satır olduğunu belirler, dataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         BookType.allCases.count // return omit
    }
    //her satırda gösterilecek metni belirler, delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         BookType.allCases[row].rawValue
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
            //string.first?.isNumber
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        return true // diğer tüm durumlar için metin değiştirlmesine izin veriyoruz
    }
    
    @IBAction private func addBook(_ sender: UIButton) {
        let bookName = bookNameTextField.text ?? ""
        let bookTypeIndex = bookTypesPickerView.selectedRow(inComponent: 0)
        let pageCount = Int(pageCountTextField.text ?? "") ?? 0

        let book = Book(name: bookName, bookType: BookType(rawValue: bookTypeIndex.description) ?? .novel , pageCount: pageCount)
        
        BookManager.shared.books.append(book)
        
        bookNameTextField.text = ""
        pageCountTextField.text = ""
    }
    
    
}
