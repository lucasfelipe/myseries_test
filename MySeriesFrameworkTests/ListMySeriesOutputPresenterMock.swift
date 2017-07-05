import Foundation
@testable import MySeriesFramework

class ListMySeriesOutputPresenterMock: ListMySeriesOutputPresenter {
    
    var series: [GetMySeriesRS]?
    
    func list(series: [GetMySeriesRS]) {
        self.series = series
    }
    
}
