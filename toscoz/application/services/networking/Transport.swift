//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

protocol Transport {
    func fetch(request: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void)
}

class NetworkTransport: Transport {
    static var shared = NetworkTransport()

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func fetch(request: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: request) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                completionHandler(.success(data))
            }
        }
        .resume()
    }
}
