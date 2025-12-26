//
//  ContentView.swift
//  MobileNotes
//

import SwiftUI

struct ContentView: View {
    @AppStorage("ShouldShowWelcomeScreen") private var shouldShowWelcomeScreen = true
    @State private var newFolderName = "New Folder"
    @State private var searchText = ""
    @State private var showingNewFolderPopover = false
    
    var body: some View {
        NavigationStack {
            if !shouldShowWelcomeScreen {
                List {
                    NavigationLink {} label: {
                        Label {
                            LabeledContent("Notes", value: "0")
                        } icon: {
                            Image(systemName: "folder")
                        }
                    }
                }
                .navigationTitle("Folders")
                .navigationBarTitleDisplayMode(.large)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingNewFolderPopover.toggle()
                        } label: {
                            Image(systemName: "folder.badge.plus")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                    
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
                    ToolbarSpacer(.fixed, placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        NavigationLink(destination: NewNoteView()) {
                            Image(systemName: "square.and.pencil")
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
                                Button(role: .cancel) {
                                    showingNewFolderPopover.toggle()
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(role: .confirm) {
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
