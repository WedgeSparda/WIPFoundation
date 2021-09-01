import Foundation

public class HTTPClient {

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

//    @discardableResult
//    func request(with request: URLRequest) -> URLSessionDataTask? {
//        let dataTask: URLSessionDataTask = self.urlSession.dataTask(with: request) { data, response, error in
//            
//        }
//
//        dataTask.resume()
//        return dataTask
//    }
}
