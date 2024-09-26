//
//  Profile.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

struct Profile {
    let name: String
    let image: UIImage
    var status: String
}

struct User {
    var login: String
    var password: String
}

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

protocol ChangeLikesDelegate: AnyObject {
    func likesChanged()
}

protocol ChangeViewsDelegate: AnyObject {
    func viewsChanged(at indexPath: IndexPath)
}
