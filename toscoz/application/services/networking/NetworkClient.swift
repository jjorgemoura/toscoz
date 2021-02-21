//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct NetworkClient {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    func fetch(request: Request) {
        transport.fetch(request: request.urlRequest, completionHandler: request.completion)
    }
}
