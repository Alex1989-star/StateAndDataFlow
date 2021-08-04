

import SwiftUI

struct ContentView: View {
	@StateObject private var timer = TimerCounter()
	@EnvironmentObject private var user: UserManager

	var body: some View {
		VStack {
            Text("Hi! \(user.savedName)")
				.font(.largeTitle)
				.offset(x: 0, y: 100)

			Text("\(timer.counter)")
				.font(.largeTitle)
				.offset(x: 0, y: 200)

			Spacer()

            ButtonView(timer: timer)
                .environmentObject(timer)
            
            LogOutView()
                .environmentObject(user)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserManager())
    }
}

struct ButtonView: View {
	@ObservedObject var timer: TimerCounter

	var body: some View {
        AppButtonView(
            title: timer.buttonTitle,
            color: .red,
            action: { timer.startTimer() }
        )
	}
}

struct LogOutView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        AppButtonView(
            title: "LogOut",
            color: .blue,
            action: { user.logout() }
        )
    }
}
