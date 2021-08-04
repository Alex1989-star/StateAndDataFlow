

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(UserManager())
        }
    }
}
