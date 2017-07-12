
import Foundation

public protocol LoginMySeriesOutputPresenter {
    func loadRequestAuthentication(request: URLRequest)
    func loginResumes()
}
