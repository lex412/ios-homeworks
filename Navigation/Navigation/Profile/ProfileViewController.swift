//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

final class ProfileViewController: UIViewController {

    private var profile = Profile(name: "Test",
                          image: (UIImage(named: "ProfileImage") ?? UIImage(systemName: "person.circle.fill"))!,
                          status: "Status")

    lazy private var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()





    profileHeaderView.setStatusButton.addTarget(self,
                                                     action:#selector(self.setStatusButtonClicked),
                                                     for: .touchUpInside)

        profileHeaderView.statusTextField.addTarget(self,
                                                    action: #selector(self.statusTextDidChanged(_:)),
                                                    for: .editingChanged)
        return profileHeaderView
    }()

    lazy private var setTitleButton: UIButton = {
        let button = createButton(withTitle: "Установи заголовок")
        button.addTarget(self,
                         action: #selector(self.setTitleButtonClicked),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"

        view.addSubview(profileHeaderView)
        view.addSubview(setTitleButton)

        setupLayout()

        profileHeaderView.setup(with: profile)
    }

func setupLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        setTitleButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            setTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            setTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc
    func setStatusButtonClicked() {
        profileHeaderView.setup(with: profile)
    }

    @objc
    func statusTextDidChanged(_ textField: UITextField) {
        if let text = textField.text {
            profile.status = text
        }
    }

    @objc
    func setTitleButtonClicked() {
        if let text = profileHeaderView.statusTextField.text {
            title = text
        }
    }
}
