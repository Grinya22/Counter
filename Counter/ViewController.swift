//
//  ViewController.swift
//  Counter
//
//  Created by Gregory Vanyurin on 29.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var clickButtonMinus: UIButton!
    
    @IBOutlet weak var clickButtonPlus: UIButton!
    
    @IBOutlet weak var clickButtonClear: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    var counterInt: Int = 0
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "0"
        historyTextView.text = "История изменений:\n"
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    @IBAction func changeClickButtonMinus(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        if counterInt > 0 {
            counterInt -= 1
            counter.text = String(counterInt)
            //historyTextView.text += ("\(dateString): значение изменено на -1\n")
        } else {
            historyTextView.text += ("\(dateString): попытка уменьшить значение счётчика ниже 0\n")
        }
        let stringOfButtonMinusInHistory = true
        
        if stringOfButtonMinusInHistory == true {
            historyTextView.text += ("\(dateString): значение изменено на -1\n")
        }
    }

    @IBAction func changeClickButtonPlus(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        counterInt += 1
        counter.text = String(counterInt)
        //historyTextView.text += ("\(dateString): значение изменено на +1\n")
        let stringOfButtonPlusInHistory = true
        
        if stringOfButtonPlusInHistory == true {
            historyTextView.text += ("\(dateString): значение изменено на +1\n")
        }
    }
    
    @IBAction func changeClickButtonClear(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        counterInt = 0
        counter.text = String(counterInt)
        //historyTextView.text += ("\(dateString): значение сброшено\n")
        let stringOfButtonClearInHistory = true
        
        if stringOfButtonClearInHistory == true {
            historyTextView.text += ("\(dateString): значение сброшено\n")
        }
    }
}
