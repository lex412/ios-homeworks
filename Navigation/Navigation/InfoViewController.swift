//
//  InfoViewController.swift
//  Navigation
//
//  Created by Lex 412 on 11.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Аллерт", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAllert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private func setupButton() {
        
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    @IBAction private func buttonAllert() {
        let alertController = UIAlertController(title: "Hello", message: "Allert", preferredStyle: .alert)
        
        let alertAction1 = UIAlertAction(title: "OK", style: .cancel) { (alert) in  print("push OK")
        }
        alertController.addAction(alertAction1)
        
        let alertAction2 = UIAlertAction(title: "Send", style: .default) { (alert) in  print("push message")
        }
        alertController.addAction(alertAction2)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        self.setupButton()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
