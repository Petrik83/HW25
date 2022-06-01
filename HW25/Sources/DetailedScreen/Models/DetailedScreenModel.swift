//
//  DetailedScreenModel.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation

struct ProfileForEdit {
    var profile: Profile
}

extension ProfileForEdit {
    static func getData(index: Int) -> Profile {
        let profiles = StorageManager().fetchProfile()
        return profiles[index]
    }
}
