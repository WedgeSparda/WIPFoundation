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
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

open class HTTPClient {

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    @discardableResult
    func request(
        with request: URLRequest,
        completion: @escaping ((NetworkResponse) -> Void)
    ) -> URLSessionDataTask? {
        let dataTask: URLSessionDataTask = self.urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            let response = self.createNetworkResponse(with: data, response: response, error: error, request: request)
            completion(response)
        }

        dataTask.resume()
        return dataTask
    }
    
    func request(
        with request: URLRequest
    ) async -> NetworkResponse {
        do {
            let (data, response) = try await self.urlSession.data(for: request)
            return createNetworkResponse(
                with: data,
                response: response,
                error: nil,
                request: request
            )
        } catch {
            return createNetworkResponse(
                with: nil,
                response: nil,
                error: error,
                request: request
            )
        }
    }
}

fileprivate extension HTTPClient {
    
    func createNetworkResponse(
        with data: Data?,
        response: URLResponse?,
        error: Error?,
        request: URLRequest
    ) -> NetworkResponse {
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        var result: Result<Data?, Error> {
            guard let error = error else {
                return .success(data)
            }
            return .failure(error)
        }
        return NetworkResponse(
            statusCode: statusCode,
            result: result,
            request: request
        )
    }
}
