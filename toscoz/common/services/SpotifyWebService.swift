//
//  SpotifyWebService.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

class SpotifyWebService: StandardSpotify {

    func songPlaying() -> Song {

        return Song(identifier: "abc", name: "high")
    }

    func song(identifier: String) -> Song {

        return Song(identifier: "sdfaf", name: "money")
    }
}
