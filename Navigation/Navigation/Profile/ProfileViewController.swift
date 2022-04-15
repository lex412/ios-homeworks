//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Lex 412 on 4/14/22.
//

import UIKit

final class ProfileViewController: UIViewController {

private let posts: [Post] = Post.demoPosts

    private var profile = Profile(name: "Test",
                                  image: (UIImage(named: "ProfileImage") ?? UIImage(systemName: "person.circle.fill"))!,
                                  status: "Status")

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        tableView.register(PostTableViewCell.self,
                           forCellReuseIdentifier: PostTableViewCell.identifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    lazy private var profileHeaderView: ProfileHeaderView = {

        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.setup(with: profile)

        profileHeaderView.setStatusButton.addTarget(self,
                                                    action:#selector(self.setStatusButtonClicked),
                                                    for: .touchUpInside)

        return profileHeaderView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        view.addSubview(tableView)

        setupLayout()
    }

    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc
    func setStatusButtonClicked() {
        if let text = profileHeaderView.statusTextField.text {
            profile.status = text
            profileHeaderView.setup(with: profile)
        }
    }
}


extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier,
                                                 for: indexPath)
            as! PostTableViewCell

        cell.setup(with: posts[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profileHeaderView
    }
}


extension ProfileViewController: UITableViewDelegate {

}
