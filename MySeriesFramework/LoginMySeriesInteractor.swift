
import Foundation

public class LoginMySeriesInteractor {
    var outputPresenter: LoginMySeriesOutputPresenter
    var repository: TokenRepository
    private var authGateway: AuthenticationGateway
    
    public init(outputPresenter: LoginMySeriesOutputPresenter, repos: TokenRepository) {
        self.outputPresenter = outputPresenter
        self.repository = repos
        authGateway = AuthenticationGatewayImpl()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginMySeriesInteractor.receiveRedirect(notification:)), name: MySeriesNotification.AuthNotification, object: nil)
    }
    
    public func authenticate() {
       authGateway.authenticate()
    }
    
    @objc func receiveRedirect(notification: Notification) {
        if let request = notification.object as? URLRequest {
            outputPresenter.loadRequestAuthentication(request: request)
        }
    }
    
    public func getToken(_ url: URL) {
        authGateway.getToken(url) { (token: Token) in
            self.repository.createOrUpdate(token: token)
            self.outputPresenter.loginResumes()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: MySeriesNotification.AuthNotification, object: nil)
    }
}
