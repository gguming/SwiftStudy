import UIKit

// UITabBarController
// 2개의 UIVeiwController, 2개의 TabBarItem

final class FirstViewController: UIViewController{}
final class SecondViewController: UIViewController{}

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = FirstViewController()
        firstVC.tabBarItem = UITabBarItem(
            title: "First",
            image: UIImage(systemName: "person"),
            tag: 0
        )
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(
            title: "Second",
            image: UIImage(systemName: "person"),
            tag: 1
        )
        
        viewControllers = [firstVC, secondVC]
    }
}


import SwiftUI

struct FirstView: View {
    var body: some View {
        Text("First Tab")
    }
}


struct SecondView: View {
    var body: some View {
        Text("Second Tab")
    }
}


struct SampleTabView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "person")
                    Text("First")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Second")
                }
        }
    }
}
