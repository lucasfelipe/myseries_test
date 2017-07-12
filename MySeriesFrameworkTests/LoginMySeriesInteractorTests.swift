
import XCTest
@testable import MySeriesFramework

class LoginMySeriesInteractorTests: XCTestCase {
    
    var loginInteractor: LoginMySeriesInteractor!
    var tokenRepository: TokenRepository!
    var loginOutputPresenter: LoginMySeriesOutputPresenterMock!
    
    override func setUp() {
        super.setUp()
        tokenRepository = TokenRepositoryStore()
        loginOutputPresenter = LoginMySeriesOutputPresenterMock()
        loginInteractor = LoginMySeriesInteractor(outputPresenter: loginOutputPresenter, repos: tokenRepository)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldAuthenticate() {
        weak var longRunnExp = expectation(description: "com.br.myseries.authenticate")
        NotificationCenter.default.addObserver(forName: MySeriesNotification.AuthNotification, object: nil, queue: nil) { (notf) in
            longRunnExp?.fulfill()
            longRunnExp = nil
        }
        self.loginInteractor.authenticate()
        waitForExpectations(timeout: 30) { (longRunnExpError) in
            XCTAssertNil(longRunnExpError, longRunnExpError!.localizedDescription)
            XCTAssertTrue(self.loginOutputPresenter.presentLoadRequestAuthentication)
            XCTAssertFalse(self.loginOutputPresenter.presentLoginResumes)
        }
        
    }
    
    
    
}
