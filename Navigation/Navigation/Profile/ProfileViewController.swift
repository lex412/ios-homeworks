//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let profile = Profile(name: "Test",
                          image: (UIImage(named: "ProfileImage") ?? UIImage(systemName: "person.circle.fill"))!,
                          status: "Status")

    lazy private var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()

    profileHeaderView.buttonShowStatus.addTarget(self,action:#selector(self.buttonShowStatus), for: .touchUpInside)
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"

        view.addSubview(profileHeaderView)

        profileHeaderView.setup(with: profile)
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        profileHeaderView.setViewFrames()
    }

    @objc
    func buttonShowStatus() {
        print(profile.status)
    }
}
