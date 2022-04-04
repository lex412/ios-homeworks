//
//  ViewController.swift
//  Netology_IB_Instruments
//
//  Created by Lex 412 on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let subView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
                    //print(subView)
                    self.view.addSubview(subView)
                    //subView.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
            subView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                }
            
    }
}

