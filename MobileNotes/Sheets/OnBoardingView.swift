//
//  OnBoardingView.swift
//  MobileNotes
//

import SwiftUI

struct OnBoardingView: View {
    // Variables
    @AppStorage("ShouldShowWelcomeScreen") private var shouldShowWelcomeScreen = true
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Text("Welcome to Notes")
                .font(.largeTitle)
                .fontWeight(.bold)
            if UIDevice.current.model == "iPad" {
                Text("Great new tools for notes synced to your Apple Account.")
                    .padding(.bottom)
            } else {
                Spacer()
            }
            OBBulletView(image: "ios_firstlaunch_welcome_1", title: "Add Almost Anything", subtitle: "Capture documents, audio, photos, and more for a richer Notes experience.")
            OBBulletView(color: .blue, image: "person.crop.circle.fill", title: "Note to Self, or with Anyone", subtitle: "Invite others to view or make changes to a note.")
            if UIDevice.current.model == "iPad" {
                OBBulletView(image: "ios_firstlaunch_welcome_3", title: "Sketch Your Thoughts", subtitle: "Draw using your finger or the Apple Pencil.")
            }
            OBBulletView(image: "quicknote", title: "Create Quick Notes Anywhere", subtitle: UIDevice.current.model == "iPad" ? "Just swipe up from the bottom right corner with your Apple Pencil to start a note when you‘re outside the app." : "Create new Quick Notes in any app from the Share menu.")
            Spacer(minLength: UIDevice.current.model == "iPhone" ? 250 : 0)
            Button {
                shouldShowWelcomeScreen = false
            } label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 350, height: 50)
                    }
                    .backgroundStyle(.accent)
            }
            Spacer(minLength: 5)
        }
        .multilineTextAlignment(.center)
        .interactiveDismissDisabled()
        .padding(10)
    }
}

struct OBBulletView: View {
    // Variables
    var color = Color.accent
    var image = "Image"
    var title = "Title"
    var subtitle = "Subtitle"
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Group {
                if let imageAsset = UIImage(named: image) {
                    Image(uiImage: imageAsset)
                        .resizable()
                } else {
                    Image(_internalSystemName: image)
                        .resizable()
                }
            }
            .scaledToFit()
            .frame(width: 36)
            .foregroundStyle(color)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 310, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    OnBoardingView()
}
