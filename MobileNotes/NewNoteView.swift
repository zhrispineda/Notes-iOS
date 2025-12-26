//
//  NewNoteView.swift
//  MobileNotes
//

import SwiftUI

struct NewNoteView: View {
    @FocusState private var isFocused: Bool
    @State private var noteText = ""
    @State private var currentDateString = ""
    @State private var selectedMathOption = "Suggest Results"
    @State private var debugging = false
    private let mathOptions = ["Insert Results", "Suggest Results", "Off"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(currentDateString)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
                TextEditor(text: $noteText)
                    .font(.title)
                    .textEditorStyle(.plain)
                    .scrollIndicators(.never)
                    .onAppear {
                        self.isFocused = true
                    }
                    .focused($isFocused)
                    .padding(.top, -15)
            }
            .onAppear {
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.timeStyle = .short
                formatter.dateFormat = "MMMM dd, yyyy 'at' h:mm a"
                currentDateString = formatter.string(from: currentDate)
            }
            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button {} label: {
//                        Image(systemName: "arrow.uturn.backward.circle")
//                            .disabled(true)
//                    }
//                }
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button {} label: {
//                        Image(systemName: "arrow.uturn.forward.circle")
//                            .disabled(true)
//                    }
//                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "square.and.arrow.up") {}.disabled(true)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        ControlGroup {
                            Button("Scan", systemImage: "document.viewfinder") {}
                            Button("Pin", systemImage: "pin.fill") {}
                            Button("Lock", systemImage: "lock.fill") {}
                        }
                        Button("Find in Note", systemImage: "magnifyingglass") {}
                        Button("Move Note", systemImage: "folder") {}
                        Menu {
                            Picker("Math Results", selection: $selectedMathOption) {
                                ForEach(mathOptions, id: \.self) { option in
                                    Text(option)
                                }
                            }
                        } label: {
                            Label("Math Results", systemImage: "equal.circle")
                            Text(selectedMathOption)
                        }
                        Menu {
                            Section {
                                Button("Clear Menu") {}
                            }
                        } label: {
                            Label("Recent Notes", systemImage: "clock")
                        }
                        Button("Lines & Grids", systemImage: "rectangle.split.3x3") {}
                        Menu {
                            Button("Set All to Small") {}
                            Button("Set All to Large") {}
                        } label: {
                            Label("Attachment View", systemImage: "rectangle.3.group")
                        }
                        Button("Delete", systemImage: "trash", role: .destructive) {}
                        
                        if debugging {
                            Section {
                                Menu {
                                    Section {
                                        Button("Handwriting Feedback", systemImage: "exclamationmark.bubble") {}
                                    }
                                } label: {
                                    Label("Debug", systemImage: "ant")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                if isFocused {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(role: .confirm) {
                            isFocused = false
                        }
                        .fontWeight(.medium)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("", systemImage: "checklist") {}
                        Spacer()
                        Button("", systemImage: "paperclip") {}
                        Spacer()
                        Button("", systemImage: "pencil.tip.crop.circle") {}
                        Spacer()
                        Button {} label: {
                            Image(systemName: "apple.writing.tools")
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "square.and.pencil")
                                .disabled(noteText.isEmpty)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewNoteView()
}
