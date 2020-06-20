//
//  Copyright © 2020 Jorge Moura. All rights reserved.
//

protocol ReadRepository {

    associatedtype Resource
    associatedtype ResponseData

    func read(from source: Resource) -> Result<ResponseData, Error>
}

protocol WriteRepository {

    associatedtype Resource
    associatedtype Payload
    associatedtype ResponseData

    func write(to source: Resource, with payload: Payload) -> Result<ResponseData, Error>
}

protocol Repository: ReadRepository, WriteRepository {
}
