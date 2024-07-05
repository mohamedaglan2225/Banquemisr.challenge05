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
            home(),
            notification(),
            addAds(),
            chat(),
            account()
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
    func home() -> UINavigationController {
//        let vc = AppStoryboards.tabBar.instantiate(HomeTabBarViewController.self)
//        vc.tabBarItem = UITabBarItem(title: "Home".localized, image: UIImage(named: "Home"), selectedImage: UIImage(named: "SelectedHome"))
//        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
//        return ColoredNav(rootViewController: vc)
        return UINavigationController()
    }
    func notification() -> UINavigationController {
//        let vc = AppStoryboards.tabBar.instantiate(OrdersTabBarController.self)
//        vc.tabBarItem = UITabBarItem(title: "Orders".localized, image: UIImage(named: "Orders"), selectedImage: UIImage(named: "SelectedOrder"))
//        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
//        return BaseNav(rootViewController: vc)
        return UINavigationController()
    }
    func addAds() -> UINavigationController {
//        let vc = AppStoryboards.tabBar.instantiate(ClinicsTabBarViewController.self)
//        vc.tabBarItem = UITabBarItem(title: "Clinics".localized, image: UIImage(named: "Clinic"), selectedImage: UIImage(named: "SelectedClinic"))
//        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
//        return BaseNav(rootViewController: vc)
        return UINavigationController()
    }
    func chat() -> UINavigationController {
//        let vc = AppStoryboards.tabBar.instantiate(CartTabBarViewController.self)
//        vc.tabBarItem = UITabBarItem(title: "Cart".localized, image: UIImage(named: "Cart"), selectedImage: UIImage(named: "SelectedCart"))
//        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
//        return BaseNav(rootViewController: vc)
        return UINavigationController()
    }
    func account() -> UINavigationController {
//        let vc = AppStoryboards.tabBar.instantiate(MoreTabBarViewController.self)
//        vc.tabBarItem = UITabBarItem(title: "More".localized, image: UIImage(named: "More"), selectedImage: UIImage(named: "SelectedMore"))
//        vc.tabBarItem.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0)
//        return BaseNav(rootViewController: vc)
        return UINavigationController()
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
