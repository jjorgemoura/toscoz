//
//  SpotifyService.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

protocol StandardSpotify {

    func songPlaying() -> Song
    func song(identifier: String) -> Song
}
