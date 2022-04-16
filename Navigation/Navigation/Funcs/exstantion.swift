//
//  exstantion.swift
//  Navigation
//
//  Created by Lex 412 on 4/16/22.
//

import UIKit


public extension UIView {
    static var identifier: String {
        String(describing: self)
    }

    func addSubviewsToAutoLayout(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
