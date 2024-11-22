//
//  ContentView.swift
//  MobileNotes
//

import SwiftUI

struct ContentView: View {
    // Variables
    @AppStorage("ShouldShowWelcomeScreen") private var shouldShowWelcomeScreen = true
    @State private var internalDebugging = false
    @State private var newFolderName = "New Folder"
    @State private var searchText = String()
    @State private var showingNewFolderPopover = false
    
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
                        Button {
                            showingNewFolderPopover.toggle()
                        } label: {
                            Image(systemName: "folder.badge.plus")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        if internalDebugging {
                            Button("", systemImage: "gear") {}
                        } else {
                            NavigationLink(destination: NewNoteView()) {
                                Image(systemName: "square.and.pencil")
                            }
                        }
                    }
                }
            }
        }
        .popover(isPresented: $showingNewFolderPopover) {
            NavigationStack {
                List {
                    TextField("", text: $newFolderName)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button("Cancel") {
                                    showingNewFolderPopover.toggle()
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Done") {
                                    showingNewFolderPopover.toggle()
                                    newFolderName = "New Folder"
                                }
                                .fontWeight(.semibold)
                            }
                        }
                }
                .navigationTitle("New Folder")
                .navigationBarTitleDisplayMode(.inline)
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
