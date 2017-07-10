
import Foundation

public protocol MySeriesGateway {
     func getMySeries(request: GetMySeriesRQ, completion: @escaping (ResultWrapper<GetMySeriesRS>) -> Void)
}
