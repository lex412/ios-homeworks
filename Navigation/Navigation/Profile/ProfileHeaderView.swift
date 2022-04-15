//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

   class ProfileHeaderView: UIView {
    
    
    let avatarImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: AutoL.padding,
                                              y: AutoL.padding,
                                              width: AutoL.avatarImageSize,
                                              height: AutoL.avatarImageSize))
        image.layer.borderWidth = 3
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.masksToBounds = true

        return image
    }()

    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black

        return label
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray

        return label
    }()

    let statusTextField: UITextField = {
            let textField = UITextField()
            textField.font = .systemFont(ofSize: 15, weight: .regular)
            textField.textColor = .black
            textField.backgroundColor = .white

            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
            textField.rightView = paddingView
            textField.rightViewMode = .always

        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true

        return textField
    }()
    
    

    let setStatusButton: UIButton = {
        createButton(withTitle: "Установи статус")
    }()
       
    override init(frame: CGRect) {
        super.init(frame: frame)

        initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        
    }

    func initialize() {
        [avatarImageView,
        fullNameLabel,
        statusLabel,
        statusTextField,
        setStatusButton].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        setupLayouts()
    }

    func setup(with profile: Profile) {
        avatarImageView.image = profile.image
        fullNameLabel.text = profile.name
        statusLabel.text = profile.status
    }
    
    

    func setupLayouts() {

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: AutoL.padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AutoL.padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: AutoL.avatarImageSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: AutoL.avatarImageSize),

            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: AutoL.padding),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AutoL.padding),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: AutoL.padding),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AutoL.padding),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -18),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: AutoL.padding / 2),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: AutoL.padding),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AutoL.padding),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: AutoL.padding),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AutoL.padding),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AutoL.padding),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
