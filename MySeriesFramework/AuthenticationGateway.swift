
import Foundation

public protocol AuthenticationGateway {
    func authenticate()
    func getToken(_ url: URL)
}
