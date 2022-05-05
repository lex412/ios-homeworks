//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText = String()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: "ProfileImage")
        let avatarImageView = UIImageView()
        avatarImageView.toAutoLayout()
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .systemRed
        avatarImageView.layer.cornerRadius = 62.5
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.image = image

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentToFullScreen))
        avatarImageView.addGestureRecognizer(tapGesture)

        return avatarImageView
    }()

    @objc func presentToFullScreen() {
        guard let toVC = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else { return }
        let customViewController = GestureViewController()
        customViewController.modalPresentationStyle = .overFullScreen
        customViewController.modalTransitionStyle = .crossDissolve

        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.window?.layer.add(transition, forKey: nil)

        toVC.present(customViewController, animated: false, completion: nil)
    }
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.toAutoLayout()
        fullNameLabel.text = "Aviator"
        fullNameLabel.textAlignment = .left
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        return fullNameLabel
    }()
    
    //    был использован textField для более удобной работы с логикой смены статуса
    lazy var statusLabel: UITextField = {
        let statusLabel = UITextField()
        statusLabel.toAutoLayout()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        statusLabel.placeholder = ""
        statusLabel.isUserInteractionEnabled = false
        return statusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.toAutoLayout()
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .left
        statusTextField.placeholder = "Enter status"
        statusTextField.setLeftPaddingPoints(10)
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.cornerRadius = 12.0

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.addGestureRecognizer(tapGesture)
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return statusTextField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusText = statusTextField.text!
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        statusTextField.resignFirstResponder()
    }
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.toAutoLayout()
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.layer.cornerRadius = 14.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return setStatusButton
    }()

    private func setupLayout(){

        NSLayoutConstraint.activate([

            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 125.0),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27.0),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50.0),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 50.0),

            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40.0),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -20.0),

            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 46.0),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    private func setupView() {
        addSubviews(avatarImageView, avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton)
        setupLayout()
        backgroundColor = .systemGray6
    }

    @objc func buttonPressed(_ sender: UIButton) {

        if self.statusTextField.hasText {
            self.statusLabel.text = self.statusText
            self.statusTextField.text = ""
            self.statusTextField.layer.borderColor = UIColor.black.cgColor
            self.statusTextField.layer.borderWidth = 1.0
            self.endEditing(true)
        } else {
            self.statusTextField.layer.borderColor = UIColor.red.cgColor
            self.statusTextField.layer.borderWidth = 1.5
        }
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
