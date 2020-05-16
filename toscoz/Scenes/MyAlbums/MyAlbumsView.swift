//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI

struct MyAlbumsView: View {

    var albums: [Album] = []

    var body: some View {

        List(albums) { album in

            HStack {
                Image("sdfdfaf")
                VStack {
                    Text(album.name)
                    Text("1977")
                        .font(.footnote)
                }
            }
        }
        //.navigationBarTitle(/*@START_MENU_TOKEN@*/"Navigation Bar"/*@END_MENU_TOKEN@*/)
    }
}

struct MyAlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MyAlbumsView(albums: CannedData.albums)
            MyAlbumsView(albums: CannedData.albums)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}