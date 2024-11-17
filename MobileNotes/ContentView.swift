//
//  ContentView.swift
//  MobileNotes
//

import SwiftUI

struct ContentView: View {
    // Variables
    @AppStorage("ShouldShowWelcomeScreen") private var shouldShowWelcomeScreen = true
    @State private var internalDebugging = false
    @State private var searchText = String()
    
    var body: some View {
        NavigationStack {
            if !shouldShowWelcomeScreen {
                List {
                }
                .navigationTitle("Folders")
                .navigationBarTitleDisplayMode(.large)
                .searchable(text: $searchText, placement: .toolbar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button {} label: {
                            Image(systemName: "folder.badge.plus")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        if internalDebugging {
                            Button {} label: {
                                Image(systemName: "gear")
                            }
                        } else {
                            Button {} label: {
                                Image(systemName: "square.and.pencil")
                            }
                        }
                    }
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
