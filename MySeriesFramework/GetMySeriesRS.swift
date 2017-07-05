import Foundation
import ObjectMapper
import RealmSwift

public class GetMySeriesRS: Object, Mappable {
    public dynamic var firstAired: Date?
    public dynamic var episode: EpisodeEntity?
    public dynamic var show: ShowEntity?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        firstAired <- map["first_aired"]
        episode <- map["episode"]
        show <- map["show"]
    }
}
