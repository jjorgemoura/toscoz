//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

protocol ReadFileSystemRepository: ReadRepository where Resource == URL {
}

protocol WriteFileSystemRepository: WriteRepository where Resource == URL {
}

protocol FileSystemRepository: ReadFileSystemRepository, WriteFileSystemRepository {
}
