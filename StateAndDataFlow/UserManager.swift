

import Combine
import Foundation

private let userNameKey = "userName"

final class UserManager: ObservableObject {
	@Published var isRegistered = false
    @Published var isValidName = false
    @Published var nameLength = 0
    
    var savedName: String {
        return userDefaults.string(forKey: userNameKey) ?? ""
    }
    var name = "" {
        didSet {
            nameLength = name.count
            isValidName = name.count >= 1
        }
    }
    
    private let userDefaults = UserDefaults.standard

	init() {
        isRegistered = !savedName.isEmpty
    }
    
    func saveUser() {
        userDefaults.setValue(name, forKey: userNameKey)
        isRegistered = true
        name = ""
    }
    
    func logout() {
        userDefaults.setValue(name, forKey: userNameKey)
        isRegistered = false
    }
}
