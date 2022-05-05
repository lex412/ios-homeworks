//
//  FeedViewController.swift
//  Navigation
//
//  Created by Lex 412 on 11.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    //var post = Post(title: "Передача post")



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.setupButton()

        // Do any additional setup after loading the view.
    }
    
    
    private lazy var button: UIButton = {

            let button = UIButton()

            button.backgroundColor = .blue
            button.layer.cornerRadius = 12
            button.setTitle("Мой пост", for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
    /*
    @objc private func buttonAction() {

            let postViewController = PostViewController()

            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title
     }


     */
        
    @objc
        func buttonTapped(sender: UIButton) {
            
            let postViewController = PostViewController()
      
            navigationController?.pushViewController(postViewController, animated: true)
        }

     

}
