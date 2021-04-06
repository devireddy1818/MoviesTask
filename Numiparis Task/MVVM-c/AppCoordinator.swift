
import UIKit

enum CoordinatorNames: String {
    case Home = "Movies"
    
    


}
class AppCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()

    func start() {
    
            ShowHomescreen()
        
    }
   lazy var viewnavigator: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController

    }()
    lazy var loginNavigator: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController

    }()
    lazy var homeNavigator: UINavigationController = {
          let navigationController = UINavigationController()
          return navigationController
      }()
    
    var window: UIWindow?
    
    
    var childCoordinators = [CoordinatorNames: Coordinator]()
       init(window:UIWindow?) {
           self.window = window
           //NotificationCenter.default.addObserver(self, selector: #selector(handlesessionExpired(_:)), name: NSNotification.Name.sessionExpired, object: nil)
       }
       
       deinit {
           NotificationCenter.default.removeObserver(self)
       }
    
   
    func configureRootViewController(_ vc: UINavigationController) {
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
    }
    
}


extension AppCoordinator : MoviesCoordinatorDelegate {
   
    func ShowHomescreen(){
           configureRootViewController(homeNavigator)
            let homeCoordinator = MoviesCoordinator(homeNavigator)
            homeCoordinator.delegate = self
            homeCoordinator.start()
            childCoordinators[CoordinatorNames.Home] =  homeCoordinator
       }
}


extension Notification.Name {
    
    static let sessionExpired = Notification.Name("sessionExpired")
}
