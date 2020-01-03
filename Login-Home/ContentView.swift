//
//  ContentView.swift
//  Login-Home
//
//  Created by Mufakkharul Islam Nayem on 1/3/20.
//  Copyright © 2020 Mufakkharul Islam Nayem. All rights reserved.
//

import SwiftUI

class Model: ObservableObject {
    @Published var loggedIn = false
}

struct ContentView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        VStack {
            if model.loggedIn {
                HomeView().transition(.opacity)
            } else {
                LogInView().transition(.opacity)
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        NavigationView {
            Text("Home Page")
                .font(.largeTitle)
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing: logoutButton)
        }
    }
    var logoutButton: some View {
        Button(action: {
            withAnimation(.easeOut) {
                self.model.loggedIn = false
            }
        }) {
            Image(systemName: "person.crop.circle.fill.badge.xmark")
                .imageScale(.large)
        }
    }
}

struct LogInView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        VStack {
            Text("Welcome to Mamoot!")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("We are glad to have you here.")
            Text("Please log in with any options from below to continue.")
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .padding()
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.model.loggedIn = true
                }
            }) {
                Text("Log in")
                    .foregroundColor(Color.white)
                    .bold()
                    .shadow(color: .secondary, radius: 10)
                    // moved modifiers here, so the whole button is tappable
                    .padding(.leading, 140)
                    .padding(.trailing, 140)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
