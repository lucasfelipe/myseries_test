
import UIKit
import WebKit
import MySeriesFramework


class LoginViewController: UIViewController, LoginMySeriesOutputPresenter {

    @IBOutlet weak var webView: UIWebView!
    var loginInteractor: LoginMySeriesInteractor!
    var router: LoginRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginInteractor = LoginMySeriesInteractor(outputPresenter: self, repos: TokenRepositoryStore())
        self.loginInteractor.authenticate()
        
        router = LoginRouterApp(with: self)
        
    }
    
    //MARK: LoginMySeriesOutputPresenter
    func loadRequestAuthentication(request: URLRequest) {
        webView.loadRequest(request)
    }
    
    func loginResumes() {
        router.goToList()
    }
    
}
