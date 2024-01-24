import SwiftUI
import Comet
import RoundedNotifiPrefsC

class RootListController: CMViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup(content: RootView())
        self.title = "RoundedNotifi"
    }
}
