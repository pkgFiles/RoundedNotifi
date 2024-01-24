import Foundation

class TweakPref {
    var settings: Settings!
    static let preferencesRef = TweakPref()
    private let prefPath: String = "/var/mobile/Library/Preferences/com.pkgfiles.roundednotifiprefs.plist"
    
    func loadPreferences() throws {
        if let data = FileManager.default.contents(atPath: prefPath) {
            remLog(String(data: data, encoding: .utf8)!)
            self.settings = try PropertyListDecoder().decode(Settings.self, from: data)
            remLog(self.settings!)
        } else {
            self.settings = Settings()
        }
    }
}

struct Settings: Codable {
    var isEnabled: Bool = false
    var cornerRadius: CGFloat = 0
}
