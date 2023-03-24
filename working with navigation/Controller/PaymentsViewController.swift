//
//  PaymentsViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 24/03/23.
//

import UIKit
import CoreData

class PaymentsViewController: UIViewController {
    var category = ""
    var alert: UIAlertController!
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var service = [Service]()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = " "
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.textColor = .black
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = 4
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "Cумма"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  p."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.textColor = .black
        textField.keyboardType = .phonePad
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = 4
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(postRequestButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var check: UILabel = {
        let label = UILabel()
        label.text = "Оплата со счета"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var card: UIButton = {
        let button = UIButton()
        button.setTitle("23000 p", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if category == "Мобильная связь" {
            label.text = "Номер телефона"
        }
        else if category == "ЖКХ" || category == "Интернет" {
            label.text = "Лицевой счёт"
        }
        else if category == "Госуслуги" {
            label.text = "ИНН"
        }
        else {
            label.text = "Номер телефона"
        }
        print(category, "category")
        
        configureConstraints()
    }
    
    
    func configureConstraints() {
        view.addSubview(label)
        view.addSubview(textfield)
        view.addSubview(price)
        view.addSubview(priceTextfield)
        view.addSubview(button)
        view.addSubview(check)
        view.addSubview(card)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textfield.heightAnchor.constraint(equalToConstant: 45),
            
            price.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            priceTextfield.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            priceTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            priceTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            check.topAnchor.constraint(equalTo: priceTextfield.bottomAnchor, constant: 16),
            check.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            card.topAnchor.constraint(equalTo: check.bottomAnchor, constant: 5),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            card.widthAnchor.constraint(equalToConstant: 100),
            card.heightAnchor.constraint(equalToConstant: 45),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func showAlert(message: String) {
        self.alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }

    @objc func dismissAlert(){
        // Dismiss the alert from here
        self.alert.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//        let appDelegate = UIScene.
//        appDelegate?.window??.rootViewController = tabBar
    }
    
    @objc func postRequestButton() {
        if textfield.text != "" && priceTextfield.text != "" {
            print("tapped")
            save()
        }
        else {
            showAlert(message: "Заполните поля")
        }
    }
    func saveInCoredata() {
        let service = Service(context: self.context)
        service.service = title
        service.price = priceTextfield.text!
        self.service.append(service)
        print("ischecked")
       do {
           try context.save()
       }catch {
           print("Error saving context \(error)")
       }
   }
   
    func save(){
        let fetchRequest: NSFetchRequest <Service> = Service.fetchRequest()
        commitPredicate = NSPredicate(format: "service == %@", title!)
        fetchRequest.predicate = commitPredicate
        do{
            let data = try context.fetch(fetchRequest).first
            saveInCoredata()
            self.showAlert(message: "Оплачено")
            print("saved")
        }
        catch {
            print("Error\(error)")
        }
    }
}



