import Foundation

public struct NetworkResponse {
    public let statusCode: Int?
    public let result: Result<Data?, Error>
    public let request: URLRequest
    
    public init(
        statusCode: Int?,
        result: Result<Data?, Error>,
        request: URLRequest
    ) {
        self.statusCode = statusCode
        self.result = result
        self.request = request
    }
    
    public var data: Data? {
        try? result.get()
    }
}
