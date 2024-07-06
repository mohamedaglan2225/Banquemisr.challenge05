//
//  AppTabBarController.swift
//  App
//
//  Created by Mohamed Aglan on 5/07/2024.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    
    //MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.initialView()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }

        let timeInterval: TimeInterval = 0.4
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    //MARK: - Initial -
    static func create() -> AppTabBarController {
        let vc = AppTabBarController()
        return vc
    }
    
    //MARK: - Design -
    private func initialView(){
        self.setupDesign()
        self.addChilds()
    }
    private func addChilds() {
        self.viewControllers = [
            nowPlayingMoviesTapBar(),
            popularMoviesTapBar(),
            upcomingMoviesTabBar()
        ]
    }
    private func setupDesign() {
        
        
        let tabBarAppearance = UITabBarItem.appearance()
        UITabBar.appearance().tintColor = UIColor.red
        self.tabBar.backgroundColor = .clear
        let attribute = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 12)]
        tabBarAppearance.setBadgeTextAttributes(attribute as [NSAttributedString.Key : Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attribute as [NSAttributedString.Key : Any], for: .normal)
        
        
        if #available(iOS 15.0, *) {
            
            let tabFont =  UIFont.systemFont(ofSize: 12)
            
            let appearance = UITabBarAppearance()
            
            
            let selectedAttributes: [NSAttributedString.Key: Any]
            = [NSAttributedString.Key.font: tabFont]
            
            let normalAttributes: [NSAttributedString.Key: Any]
            = [NSAttributedString.Key.font: tabFont, NSAttributedString.Key.foregroundColor: UIColor.gray]
            
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            
            appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
            
            appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
            appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
            
        }
        
    }
    
    //MARK: - Doctors VCs -
    func nowPlayingMoviesTapBar() -> UINavigationController {
        let vc = NowPlayingMoviesView()
        vc.tabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(named: "watch"), selectedImage: UIImage(named: "watch"))
        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
        vc.title = "Now Playing"
        return ColoredNav(rootViewController: vc)
    }
    
    func popularMoviesTapBar() -> UINavigationController {
        let vc = PopularMoviesView()
        vc.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "media"), selectedImage: UIImage(named: "media"))
        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
        return BaseNav(rootViewController: vc)
    }
    func upcomingMoviesTabBar() -> UINavigationController {
        let vc = UpcomingMoviesView()
        vc.tabBarItem = UITabBarItem(title: "Upcoming", image: UIImage(named: "DashBoard"), selectedImage: UIImage(named: "DashBoard"))
        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
        return BaseNav(rootViewController: vc)
    }
    
}
extension AppTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let _ = viewControllers else { return false }
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        
        guard fromView != toView else {
            return false
        }
        
        UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        return true
    }
}
