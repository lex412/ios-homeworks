//
//  Helper.swift
//  Navigation
//
//  Created by Lex 412 on 4/15/22.
//

import UIKit

func createButton(withTitle title: String) -> UIButton {

    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 14

    button.layer.shadowOffset = .init(width: 4, height: 4)
    button.layer.shadowRadius = 4
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOpacity = 0.7

    return button
}



func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
    var set = Set<Int>()
    while set.count < count {
        set.insert(Int.random(in: min...max))
    }
    
    return Array(set)
}


