//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct Famelz {

    func perform(request: String) -> Response {

        


        let xxx = URLSession.shared.dataTask(with: URL(string: "www.google.com")!) { (data, response, error) in

        }
        xxx.resume()

        return Response()
    }
}

struct Response {
}

struct FamelzResource {

}

struct FamelzBackendRegistry {

}

struct FamelzEndpointPath {

}
