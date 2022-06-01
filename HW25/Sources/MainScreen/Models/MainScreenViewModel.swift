//
//  MainScreenViewModel.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation

struct Profiles {
    var profiles: [Profile]
}

extension Profiles {
    static func getData() -> [Profile] {
        return StorageManager().fetchProfile()
    }
}
