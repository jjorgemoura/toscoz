//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

struct TopAlbumsRepo {
    var topAlbums: (String) -> AnyPublisher<TopAlbumsResponse, Error>
}

struct TopAlbumsResponse: Decodable, Equatable {
    let items: [ArtistResponse]
}

struct ArtistResponse: Decodable, Equatable {
    let id: String
    let name: String
}

extension TopAlbumsRepo {
    static var live = Self(
        topAlbums: { token in
            guard let url = URL(string: "https://api.spotify.com/v1/me/top/artists") else { fatalError("Devs error") }

            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .map { data, response in data
                    print(response)
                    return data
                }
                .mapError({ error -> Error in
                    print(error)
                    return error
                })
                .decode(type: TopAlbumsResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        })
}

extension TopAlbumsRepo {
    static let empty = Self(
        topAlbums: { _ in
            Just(TopAlbumsResponse(items: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })
//
//    static let happyPath = Self(
//        topAlbums: { _ in
//            Just(TopAlbumsResponse())
//                .setFailureType(to: Error.self)
//                .eraseToAnyPublisher()
//        })

    static let failed = Self(
        topAlbums: { _ in
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
