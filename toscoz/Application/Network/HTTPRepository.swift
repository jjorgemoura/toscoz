//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation
import os.log

class HTTPRepository: ReadNetworkRepository {

    //    typealias Resource = URL
    //    typealias Response = Data

    private let urlSessionConfiguration: URLSessionConfiguration
    private let dataSession: URLSession
    private var dataTask: URLSessionTask?

    init(urlSessionConfiguration: URLSessionConfiguration) {
        self.urlSessionConfiguration = urlSessionConfiguration
        self.dataSession = URLSession(configuration: urlSessionConfiguration)
    }

    static func standard() -> HTTPRepository {
        let configuration = URLSessionConfiguration.default
        return HTTPRepository(urlSessionConfiguration: configuration)
    }

    func read(from source: URL) -> Result<Data, Error> {

        dataTask?.cancel()

        dataTask = dataSession.dataTask(with: source) { data, urlResponse, error in
            print(data ?? "sdas")
            print(urlResponse ?? "sdas")
            print(error ?? "sdas")

            if let error = error {
                //FALHOU
                //os_log("jghjhjg", log: OSLog.default, type: .error, <#T##args: CVarArg...##CVarArg#>)
                print("OPPS -> \(error)")
                return
            }

            if let data = data, let response = urlResponse as? HTTPURLResponse {

                print(String(data: data, encoding: .utf8) ?? "")
                print(response.statusCode)

                if response.statusCode < 500 {
                    print("sdfsdf")
                }
            }
        }

        dataTask?.resume()

        return .success(Data())
    }
}
