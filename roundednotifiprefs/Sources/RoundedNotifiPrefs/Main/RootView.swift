import SwiftUI

struct RootView: View {
    @StateObject private var preferenceStorage = PreferenceStorage()
    
    var imagePath: String = {
        var path: String = "/var/jb/Library/PreferenceBundles/RoundedNotifiPrefs.bundle/TitleLogo.png"
        
        if !FileManager().fileExists(atPath: path) {
            path = "/Library/PreferenceBundles/RoundedNotifiPrefs.bundle/TitleLogo.png"
        }
        
        return path
    }()

    var body: some View {
        Form {
            Section {} footer: {
                HStack {
                    if let image = UIImage(contentsOfFile: imagePath) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
            
            Section {
                Toggle("Enabled", isOn: $preferenceStorage.isEnabled)
            } header: {
                Text("General")
            }
            
            Section {
                HStack {
                    Text("0")
                    Slider(value: $preferenceStorage.cornerRadius, in: 0...50, step: 1.0)
                    Text("\(Int(preferenceStorage.cornerRadius))")
                }
            } header: {
                Text("Corner Radius")
            }
            
            Section {
                Button("Respring") {
                    guard let window = UIApplication.shared.windows.first else { fatalError() }
                    while true {
                        window.snapshotView(afterScreenUpdates: false)
                    }
                }
            } footer: {
                Text("Tweak Designed for iPhone X and above.").padding()
            }
        }
    }
}
