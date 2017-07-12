
import Foundation
import RealmSwift

public protocol TokenRepository {
    func getToken() -> Token
    func createOrUpdate(token: Token)
    func deleteToken()
}

public class TokenRepositoryStore: TokenRepository {
    
    private var tokenSaved: Token!
    private var realmDB: Realm
    
    public init() {
        realmDB = try! Realm()
        tokenSaved = realmDB.objects(Token.self).first
    }
    
    public func getToken() -> Token {
        return tokenSaved
    }
    
    public func createOrUpdate(token: Token) {
        let update = (tokenSaved != nil) ? true : false
        try! realmDB.write { realmDB.add(token, update: update) }
    }
    
    public func deleteToken() {
        try! realmDB.write {
            realmDB.delete(tokenSaved)
        }
    }
}
