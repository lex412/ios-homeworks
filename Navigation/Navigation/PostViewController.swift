//
//  PostViewController.swift
//  Navigation
//
//  Created by Lex 412 on 11.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Anonymous"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        
        //self.navigationItem.rightBarButtonItem = myButton
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoScreen))
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = myButton
        
    }
    
    
    
    @objc private func infoScreen () {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
        
        
        
    }
    
}
