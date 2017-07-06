
import Foundation

public protocol AuthenticationGateway {
    var redirectNotification: Notification! { get }
    var stopNotification: Notification! { get }
    func authenticate()
}
