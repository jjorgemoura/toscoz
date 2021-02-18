//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

protocol EventHandler {
    @discardableResult
    func post(event: Event) -> Bool
}

protocol Event {}
