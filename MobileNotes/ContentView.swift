//
//  ContentView.swift
//  MobileNotes
//

import SwiftUI

struct ContentView: View {
    // Variables
    @AppStorage("ShouldShowWelcomeScreen") private var shouldShowWelcomeScreen = true
    
    var body: some View {
        NavigationStack {
            if !shouldShowWelcomeScreen {
                List {
                    EmptyView()
                }
            }
        }
        .sheet(isPresented: $shouldShowWelcomeScreen) {
            OnBoardingView()
        }
    }
}

#Preview {
    ContentView()
}
