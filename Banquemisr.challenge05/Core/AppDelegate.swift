//
//  AppDelegate.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/5/24.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - Properties -
    let reachability: Reachability = Reachability()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.startObserveNetworkChange()
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    queue.suspend()
                }
            } else {
                print("No network connection")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}



extension AppDelegate {
    
    //MARK: - Networking -
    private func startObserveNetworkChange() {
        reachability.listen { [weak self] status in
            switch status {
            case .unknown:
                break
            case .notReachable:
                ConnectionAlertManager.shared.showConnectionLost()
            case .reachable(_):
                guard self?.reachability.lastStatus == .notReachable else {return}
                ConnectionAlertManager.shared.showConnectionRestored()
            }
        }
    }
    
}
