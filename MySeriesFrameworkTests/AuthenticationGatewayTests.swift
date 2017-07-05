import XCTest
@testable import MySeriesFramework

class AuthenticationGatewayTests: XCTestCase {
    
    let credentials = WSCredentials()
    var authenticationService: MySeriesGateway!
    
    override func setUp() {
        super.setUp()
        self.authenticationService = MySeriesGatewayImpl()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAuthenticationResultSuccessCode() {
        
    }
    
}
