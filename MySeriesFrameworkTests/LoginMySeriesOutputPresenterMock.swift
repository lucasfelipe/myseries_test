
import Foundation
@testable import MySeriesFramework

class LoginMySeriesOutputPresenterMock: LoginMySeriesOutputPresenter {
    
    var presentLoadRequestAuthentication = false
    var presentLoginResumes = false
    
    func loadRequestAuthentication(request: URLRequest) {
        presentLoadRequestAuthentication = true
    }
    
    func loginResumes() {
        presentLoginResumes = true
    }
    
}
