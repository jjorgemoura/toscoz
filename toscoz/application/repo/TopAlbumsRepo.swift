//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

struct TopAlbumsRepo {
    var topAlbums: () -> AnyPublisher<TopAlbumsResponse, Error>
}

struct TopAlbumsResponse: Decodable, Equatable {
}

extension TopAlbumsRepo {
    static var live = Self(
        topAlbums: {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.metaweather.com/api/location/")!)
                .map { data, _ in data }
                .decode(type: TopAlbumsResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        })
}

extension TopAlbumsRepo {
    static let empty = Self(
        topAlbums: {
            Just(TopAlbumsResponse())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })

    static let happyPath = Self(
        topAlbums: {
            Just(TopAlbumsResponse())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })

    static let failed = Self(
        topAlbums: {
            Fail(error: NSError(domain: "", code: 1))
                .eraseToAnyPublisher()
        })
}

// class HistoryRepo<AuthDataUrlRepo: URLReadRepo>: HistoryRepoProtocol where AuthDataUrlRepo.ReturnType == Data {
//
//    private let historyRepo: TransformingReadRepo<Data, HistoryResponse>
//    private let eventHandler: EventHandler
//    private let asyncHandler: AsyncHandlerProtocol
//    private let remoteConfigRepo: RemoteConfigRepo
//
//    init(authDataUrlRepo: AuthDataUrlRepo, remoteConfigRepo: RemoteConfigRepo, eventHandler: EventHandler, asyncHandler: AsyncHandlerProtocol) {
//        self.historyRepo = TransformingReadRepo(fromSource: authDataUrlRepo, withTransformer: DataToCodableTransformer<HistoryResponse>())
//        self.asyncHandler = asyncHandler
//        self.eventHandler = eventHandler
//        self.remoteConfigRepo = remoteConfigRepo
//    }
//
//    func requestHistory() {
//        asyncHandler.inBackground {
//            let result = self.remoteConfigRepo.getRemoteConfig().mapSuccess { remoteConfig in
//                self.historyRepo.read(remoteConfig.historyUrl)
//            }
//            self.asyncHandler.inForeground {
//                self.eventHandler.post(HistoryRequestComplete(result: result))
//            }
//        }
//    }
// }
