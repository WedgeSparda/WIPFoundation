// MIT License
//
// Copyright (c) [2021] [Roberto Pastor Ortiz]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import Combine

open class WIPHTTPClient {

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    @discardableResult
    func request(
        with request: URLRequest,
        completion: @escaping ((WIPHTTPResponse) -> Void)
    ) -> URLSessionDataTask {
        let dataTask: URLSessionDataTask = self.urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            let response = self.createResponse(with: data, response: response, error: error, request: request)
            completion(response)
        }

        dataTask.resume()
        return dataTask
    }
    
    func request(
        with request: URLRequest
    ) async -> WIPHTTPResponse {
        do {
            let (data, response) = try await self.urlSession.data(for: request)
            return createResponse( with: data, response: response, error: nil, request: request)
        } catch {
            return createResponse(with: nil, response: nil, error: error, request: request)
        }
    }
    
    func request(
        with request: URLRequest
    ) -> AnyPublisher<WIPHTTPResponse, URLError> {
        urlSession.dataTaskPublisher(for: request)
            .map { data, response in
                self.createResponse(with: data, response: response, error: nil, request: request)
            }
            .eraseToAnyPublisher()
    }
}

fileprivate extension WIPHTTPClient {
    
    func createResponse(
        with data: Data?,
        response: URLResponse?,
        error: Error?,
        request: URLRequest
    ) -> WIPHTTPResponse {
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        var result: Result<Data?, Error> {
            guard let error = error else {
                return .success(data)
            }
            return .failure(error)
        }
        return WIPHTTPResponse(
            statusCode: statusCode,
            result: result,
            request: request
        )
    }
}
