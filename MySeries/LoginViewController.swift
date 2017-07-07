
import UIKit
import WebKit
import MySeriesFramework


class LoginViewController: UIViewController {

    @IBOutlet weak var webV: UIWebView!
    
    let service: AuthenticationGateway = AuthenticationGatewayImpl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.receiveRedirect(notification:)), name: MySeriesNotification.AuthNotification, object: nil)
        service.authenticate()
        
    }
    
    func receiveRedirect(notification: Notification) {
        let request = notification.object as! URLRequest
        webV.loadRequest(request)
    }

    func requestToken(url: URL) {
        service.getToken(url)
    }

}
