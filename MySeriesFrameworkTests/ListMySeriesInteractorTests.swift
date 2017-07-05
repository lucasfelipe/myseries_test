import XCTest
@testable import MySeriesFramework

class ListMySeriesInteractorTests: XCTestCase {
    
    var listMySeriesInteractor: ListMySeriesInteractor!
    var mySeriesRepository: MySeriesRepository!
    var listMySeriesOutputPresenter: ListMySeriesOutputPresenterMock!
    
    override func setUp() {
        super.setUp()
        mySeriesRepository = MySeriesRepositoryStore()
        listMySeriesOutputPresenter = ListMySeriesOutputPresenterMock()
        listMySeriesInteractor = ListMySeriesInteractor(presenterOutput: listMySeriesOutputPresenter, repository: mySeriesRepository)
    }
    
    override func tearDown() {
        super.tearDown()
        mySeriesRepository.deleteAll()
    }
    
    func testShouldListMySeries() {
        let entity = GetMySeriesRS()
        entity.firstAired = Date()
        entity.episode = EpisodeEntity()
        entity.show = ShowEntity()
        
        mySeriesRepository.create(mySerie: entity)
        
        let allSeries = mySeriesRepository.all()
        
        listMySeriesInteractor.list()
        
        XCTAssertNotNil(listMySeriesOutputPresenter.series)
        XCTAssertEqual(listMySeriesOutputPresenter.series?.count, allSeries.count)
    }
    
}
