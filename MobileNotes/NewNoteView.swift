//
//  NewNoteView.swift
//  MobileNotes
//

import SwiftUI

struct NewNoteView: View {
    @State private var noteText = ""
    @State private var currentDateString = String()
    @FocusState private var isFocused: Bool
    
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(systemName: "arrow.uturn.backward.circle")
                            .disabled(true)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(systemName: "arrow.uturn.forward.circle")
                            .disabled(true)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(systemName: "square.and.arrow.up")
                            .disabled(noteText.isEmpty)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                if isFocused {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            isFocused = false
                        }
                        .fontWeight(.medium)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {} label: {
                            Image(systemName: "checklist")
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "paperclip")
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "pencil.tip.crop.circle")
                        }
                        Spacer()
                        Button {} label: {
                            Image(_internalSystemName: "apple.writing.tools")
                        }
                        Spacer()
                        Button {} label: {
                            Image(_internalSystemName: "square.and.pencil")
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
