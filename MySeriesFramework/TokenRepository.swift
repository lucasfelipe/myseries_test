
import Foundation
import RealmSwift

protocol TokenRepository {
    func getToken() -> Token
    func createOrUpdate(token: Token)
    func deleteToken()
}

class TokenRepositoryStore: TokenRepository {
    
    private var tokenSaved: Token!
    private var realmDB: Realm
    
    init() {
        realmDB = try! Realm()
        tokenSaved = realmDB.objects(Token.self).first
    }
    
    func getToken() -> Token {
        return tokenSaved
    }
    
    func createOrUpdate(token: Token) {
        let update = (tokenSaved != nil) ? true : false
        try! realmDB.write { realmDB.add(token, update: update) }
    }
    
    func deleteToken() {
        try! realmDB.write {
            realmDB.delete(tokenSaved)
        }
    }
}
