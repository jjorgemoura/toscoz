//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct CannedData {

    static let albums: [Album] = {

        let artist1 = Artist(id: "23124", name: "Pink Floyd")
        let artist2 = Artist(id: "45345", name: "The Mars Volta")
        let artist3 = Artist(id: "56700", name: "Mao Morta")
        let artist4 = Artist(id: "32432", name: "Genesis")
        let artist5 = Artist(id: "56754", name: "Cachupa Psicadelica")
        let artist6 = Artist(id: "76543", name: "Omar Rodriguez Lopez")

        let album1 = Album(id: "12345", name: "Animals", artist: [artist1], popularity: 134)
        let album2 = Album(id: "23444", name: "Frances de Mute", artist: [artist2], popularity: 434)
        let album3 = Album(id: "56456", name: "No Fim Era o frio", artist: [artist3], popularity: 795)
        let album4 = Album(id: "73435", name: "Duke", artist: [artist4], popularity: 5673)
        let album5 = Album(id: "98764", name: "Pomba Pardal", artist: [artist5], popularity: 1346)
        let album6 = Album(id: "87654", name: "Chocolate", artist: [artist6], popularity: 1364)

        return [album1, album2, album3, album4, album5, album6]
    }()
}
