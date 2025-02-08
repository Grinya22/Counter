//
//  SecondViewController.swift
//  Counter
//
//  Created by Gregory Vanyurin on 08.02.2025.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var clickButtonMinus: UIButton!
    @IBOutlet weak var clickButtonPlus: UIButton!
    @IBOutlet weak var clickButtonClear: UIButton!
    @IBOutlet weak var counter: UILabel!
    
    var counterInt: Int = 0
    var history: [String] = []
    
    var savedUsername: String = ""
    var rememberMe: Bool = false
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterInt = UserDefaults.standard.integer(forKey: "lastCounterSession")
        history = UserDefaults.standard.array(forKey: "lastHistorySession") as? [String] ?? []
        
        counter.text = String(counterInt)
        
        updateHistory()
        
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        
        scrollToBottom()
    }
    
    // MARK: - UserDefaults
    
    func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    func saveLastSession() {
        UserDefaults.standard.set(counterInt, forKey: "lastCounterSession")
        UserDefaults.standard.set(history, forKey: "lastHistorySession")
    }
    
    func updateHistory() {
        historyTextView.text = "История изменений:\n" + history.joined(separator: "\n")
        scrollToBottom()
    }
    
    // MARK: - IBAction
    
    @IBAction func changeClickButtonMinus(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        if counterInt > 0 {
            counterInt -= 1
            counter.text = String(counterInt)
            history.append("\(dateString): значение изменено на -1\n")
            
        } else {
            history.append("\(dateString): попытка уменьшить значение счётчика ниже 0\n")
        }
        
        saveLastSession()
        updateHistory()
    }
    
    @IBAction func changeClickButtonPlus(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        counterInt += 1
        counter.text = String(counterInt)
        history.append("\(dateString): значение изменено на +1\n")
        
        saveLastSession()
        updateHistory()
    }
    
    @IBAction func changeClickButtonClear(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        
        counterInt = 0
        counter.text = String(counterInt)
        history.append("\(dateString): значение сброшено\n")
        
        saveLastSession()
        updateHistory()
    }
}
