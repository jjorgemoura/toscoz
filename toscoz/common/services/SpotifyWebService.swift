//
//  SpotifyWebService.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

class SpotifyWebService: SpotifyService {

    deinit {
        print("JM - D4 -> \(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())")
    }

    init() {
        print("JM - 4 -> \(self)")
    }

    func songPlaying() -> Song {

        return Song(identifier: "abc", name: "high")
    }

    func song(identifier: String) -> Song {

        return Song(identifier: "sdfaf", name: "money")
    }
}
