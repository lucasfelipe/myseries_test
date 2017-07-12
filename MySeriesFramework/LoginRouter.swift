
import Foundation

public protocol DefaultRouter {
    init(with viewController: UIViewController)
}

public protocol LoginRouter: DefaultRouter {
    func goToList()
}
