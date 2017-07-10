
import UIKit
import WebKit
import MySeriesFramework


class LoginViewController: UIViewController {

    @IBOutlet weak var webV: UIWebView!
    
    let service: AuthenticationGateway = AuthenticationGatewayImpl()
    private let loginToListSegue = "LOGIN_TO_LIST"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.receiveRedirect(notification:)), name: MySeriesNotification.AuthNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.redirectToList), name: MySeriesNotification.StopAuthNotification, object: nil)
        service.authenticate()
        
    }
    
    func receiveRedirect(notification: Notification) {
        let request = notification.object as! URLRequest
        webV.loadRequest(request)
    }

    func requestToken(url: URL) {
        service.getToken(url)
    }
    
    func redirectToList() {
        self.performSegue(withIdentifier: self.loginToListSegue, sender: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: MySeriesNotification.AuthNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: MySeriesNotification.StopAuthNotification, object: nil)
    }

}
