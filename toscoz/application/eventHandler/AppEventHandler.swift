//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

class AppEventHandler: EventHandler, EventRegister {

    private var eventRegistry: [ObjectIdentifier: (Event) -> Void] = [:]

    func register<T: Event>(eventBlock: @escaping (T) -> Void) {

        let eventType = type(of: T.self)
        let objectID = ObjectIdentifier(eventType)

        eventRegistry[objectID] = { event in
            if let event = event as? T {
                eventBlock(event)
            }
        }
    }

    func post(event: Event) -> Bool {
        let eventType = type(of: event)
        let objectID = ObjectIdentifier(eventType)

        if let action = eventRegistry[objectID] {
            action(event)
            return true
        }

        return false
    }

//    func register22(eventBlock: @escaping (TopAlbumsTappedEvent) -> Void) {
//
//        let eventType = type(of: TopAlbumsTappedEvent.self)
//        let objectID = ObjectIdentifier(eventType)
//
//        eventRegistry[objectID] = { event in
//            if let event = event as? TopAlbumsTappedEvent {
//                eventBlock(event)
//            }
//        }
//    }
}
