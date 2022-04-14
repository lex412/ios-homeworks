//
//  TabBarController.swift
//  Navigation
//
//  Created by Lex 412 on 11.04.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum TabBarItem: Int {

            case feed

            case profile

            

            var title: String {

                switch self {

                case .feed:

                    return "Лента"

                case .profile:

                    return "Профиль"

                }

            }

            var iconName: String {

                switch self {

                case .feed:

                    return "newspaper"

                case .profile:

                    return "person"

                }

            }

        }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()

        // Do any additional setup after loading the view.
    }
    
    private func setupTabBar() {

            let dataSource: [TabBarItem] = [.feed, .profile]

            self.viewControllers = dataSource.map {

                switch $0 {

                case .feed:

                    let feedViewController = FeedViewController()

                    return self.wrappedInNavigationController(with: feedViewController, title: $0.title)

                case .profile:

                    let profileViewController = ProfileViewController()

                    return self.wrappedInNavigationController(with: profileViewController, title: $0.title)

                }

            }

            self.viewControllers?.enumerated().forEach {

                $1.tabBarItem.title = dataSource[$0].title

                $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)

                $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)

            }

        }

    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {

            return UINavigationController(rootViewController: with)

        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
