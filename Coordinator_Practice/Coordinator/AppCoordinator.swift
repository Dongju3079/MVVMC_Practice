import Foundation
import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        print(#fileID, #function, #line, "-start ")
        self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        // TODO: here you could check if user is signed in and show appropriate screen
        let coordinator = FirstCoodinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

protocol SignInListener {
    func firstVCButtonTapped()
    func secondVCButtonTapped()
    func thirdVCButtonTapped()
    func reuseVCButtonTapped()
}

extension AppCoordinator: SignInListener {
    func reuseVCButtonTapped() {
        let coordinator = ThirdCoordinator(changeColor: true)
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
    
    func secondVCButtonTapped() {
        let coordinator = ThirdCoordinator(changeColor: false)
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
    
    func thirdVCButtonTapped() {
        let coordinator = FirstCoodinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
    
    func firstVCButtonTapped() {
        let coordinator = SecondCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}
