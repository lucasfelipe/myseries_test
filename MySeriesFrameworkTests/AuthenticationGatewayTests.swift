import XCTest
@testable import MySeriesFramework

class AuthenticationGatewayTests: XCTestCase {
    
    let credentials = WSCredentials()
    var authenticationService: AuthenticationGateway!
    
    override func setUp() {
        super.setUp()
        self.authenticationService = AuthenticationGatewayImpl()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAuthenticationResultSuccessCode() {
        let authExp = expectation(description: "Authenticate")
        NotificationCenter.default.addObserver(forName: MySeriesNotification.AuthNotification, object: nil, queue: nil) { (notf) in
            authExp.fulfill()
        }
        self.authenticationService.authenticate()
        
        waitForExpectations(timeout: 30) { (authExpError) in
            XCTAssertNil(authExpError, authExpError!.localizedDescription)
        }
        
    }
    
    
    
}
