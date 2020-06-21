//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

enum CannedData {

    static let albums: [Album] = {

        let artist1 = Artist(id: "23124", type: "artist", name: "Pink Floyd", spotifyUri: "123456781")
        let artist2 = Artist(id: "45345", type: "artist", name: "The Mars Volta", spotifyUri: "123456782")
        let artist3 = Artist(id: "56700", type: "artist", name: "Mao Morta", spotifyUri: "123456783")
        let artist4 = Artist(id: "32432", type: "artist", name: "Genesis", spotifyUri: "123456784")
        let artist5 = Artist(id: "56754", type: "artist", name: "Cachupa Psicadelica", spotifyUri: "123456785")
        let artist6 = Artist(id: "76543", type: "artist", name: "Omar Rodriguez Lopez", spotifyUri: "123456786")

        let album1 = Album(id: "12345", type: "album", name: "Animals", artists: [artist1], albumType: "album", popularity: 134)
        let album2 = Album(id: "23444", type: "album", name: "Frances de Mute", artists: [artist2], albumType: "album", popularity: 434)
        let album3 = Album(id: "56456", type: "album", name: "No Fim Era o frio", artists: [artist3], albumType: "album", popularity: 795)
        let album4 = Album(id: "73435", type: "album", name: "Duke", artists: [artist4], albumType: "album", popularity: 5673)
        let album5 = Album(id: "98764", type: "album", name: "Pomba Pardal", artists: [artist5], albumType: "album", popularity: 1346)
        let album6 = Album(id: "87654", type: "album", name: "Chocolate", artists: [artist6], albumType: "album", popularity: 1364)

        return [album1, album2, album3, album4, album5, album6]
    }()
}
