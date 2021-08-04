//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct RegisterView: View {
	@State private var name = ""
	@EnvironmentObject var user: UserManager

    var body: some View {
		VStack {
            HStack {
            TextField("Enter your name", text: $user.name)
				.multilineTextAlignment(.center)
                .border(Color.black).padding()
                
            Text("\(user.nameLength)")
                .foregroundColor(observeTextColor())
                .padding()
            }
			Button(action: registerUser) {
				HStack {
					Image(systemName: "checkmark.circle")
					Text("OK")
				}
                .disabled(!user.isValidName)
			}
		}
    }
    
    private func observeTextColor() -> Color {
        if user.isValidName {
            return Color.green
        } else {
            return Color.red
    }
}

	private func registerUser() {
        if !user.name.isEmpty {
            user.saveUser()
        }
	}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
		RegisterView().environmentObject(UserManager())
    }
}
