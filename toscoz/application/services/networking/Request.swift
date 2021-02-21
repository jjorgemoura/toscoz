//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

protocol Fetchable: Decodable {
    static var apiBasePath: String? { get }
}

struct Request {
    let urlRequest: URLRequest
    let completion: (Result<Data, Error>) -> Void
}

extension Request {
    static func fetching<Model: Fetchable>(_ modelType: Model.Type, id: String, decoder: JSONDecoder, completion: @escaping (Result<Model, Error>) -> Void) -> Request {
        var url = URL(string: "")!
        if let apiBasePath = Model.apiBasePath {
            url.appendPathComponent(apiBasePath)
            url.appendPathComponent(id)
        }

        return Self.fetching(modelType, url: url, decoder: decoder, completion: completion)
    }

    static func fetching<Model: Fetchable>(_: Model.Type, url: URL, decoder: JSONDecoder, completion: @escaping (Result<Model, Error>) -> Void) -> Request {
        let request = URLRequest(url: url)

        let requestCompletion: (Result<Data, Error>) -> Void = { responseResult in
            let result = Result<Model, Error> {
                return try decoder.decode(Model.self, from: responseResult.get())
            }
            completion(result)
        }

        return Request(urlRequest: request, completion: requestCompletion)
    }
}
