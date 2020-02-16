//
//  Copyright © 2020 Jorge Moura. All rights reserved.
//

import Foundation

protocol ReadNetworkRepository: ReadRepository where Resource == URL {
}

protocol WriteNetworkRepository: WriteRepository where Resource == URL {
}

protocol NetworkRepository: ReadNetworkRepository, WriteNetworkRepository {
}
