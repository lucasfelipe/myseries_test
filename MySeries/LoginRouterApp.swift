
import Foundation
import MySeriesFramework

struct LoginRouterApp: LoginRouter {
    private var viewController: UIViewController
    private let loginToListSegue = "LOGIN_TO_LIST"
    
    init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goToList() {
        viewController.performSegue(withIdentifier: loginToListSegue, sender: viewController)
    }
}
