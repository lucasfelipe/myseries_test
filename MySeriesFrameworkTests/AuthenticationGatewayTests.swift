import XCTest

class AuthenticationGatewayTests: XCTestCase {
    
    let credentials = WSCredentials(with: "code", grant: GrantType.authorization)
    var authenticationService: AuthenticationGateway!
    
    override func setUp() {
        super.setUp()
        self.authenticationService = AuthenticationGatewayImpl()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAuthenticationResultSuccessCode() {
        
    }
    
}
