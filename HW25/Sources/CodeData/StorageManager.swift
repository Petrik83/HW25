//
//  StorageManager.swift
//  HW25
//
//  Created by Александр Петрович on 01.06.2022.
//

import Foundation
import CoreData
import UIKit

class StorageManager {
    
    func saveProfile(profile: String) -> Profile {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Profile", in: context) else { return Profile() }
        let profileObject = Profile(entity: entity, insertInto: context)
        profileObject.name = profile
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return profileObject
    }
    
    func fetchProfile() -> [Profile] {
        var profile = [Profile]()
        let context = getContext()
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        do {
            profile = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return profile
    }
    
    func deleteProfile(profileIndex: Int) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        
        if let results = try? context.fetch(fetchRequest) {
            context.delete(results[profileIndex])
        }
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func editProfile(complition: @escaping () -> (name: String, birthday: String, gender: String, profileIndex: Int)) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                let (name, birthday, gender, profileIndex) = complition()
                results[profileIndex].setValue(name, forKey: "name")
                results[profileIndex].setValue(birthday, forKey: "birthday")
                results[profileIndex].setValue(gender, forKey: "gender")
                do {
                    try context.save()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

