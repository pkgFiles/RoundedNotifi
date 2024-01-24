import Foundation
import Comet

// MARK: - Internal

final class PreferenceStorage: ObservableObject {
    private static let registry: String = "/var/mobile/Library/Preferences/com.pkgfiles.roundednotifiprefs.plist"

    @Published(key: "isEnabled", registry: registry) var isEnabled = false
    @Published(key: "cornerRadius", registry: registry) var cornerRadius = 0.0
}
