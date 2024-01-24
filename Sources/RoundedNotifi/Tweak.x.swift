import Orion
import RoundedNotifiC
import UIKit

let prefPath = TweakPref.preferencesRef.settings

final class RoundedNotifiPref: Tweak {
    
    init() {
        remLog("Initialize Preferences...")
        
        do {
            try TweakPref.preferencesRef.loadPreferences()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            loadPref()
        }
    }
}

func loadPref() {
    remLog("Loading Preferences...")
    do {
        try TweakPref.preferencesRef.loadPreferences()
    } catch let error as NSError {
        remLog("Preferences can't get loaded: \(error)")
    }
}

class SBCoverSheetPrimarySlidingViewControllerHook: ClassHook<SBCoverSheetPrimarySlidingViewController> {
    
    func viewWillAppear(_ animated: Bool) {
        guard let isTweakEnabled = prefPath?.isEnabled else { orig.viewWillAppear(animated); return }
        
        if isTweakEnabled, #available(iOS 13.0, *) {
            /*
             //    SBCoverSheetPanelBackgroundContainerView
             //    Set the radius to every subviews of the CoverSheet
             */
            target.view.subviews[0].clipsToBounds = true
            target.view.subviews[0].layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            target.view.subviews[0].layer.cornerCurve = .continuous
            target.view.subviews[0].layer.cornerRadius = prefPath?.cornerRadius ?? 0
            
            /*
             //    CSCoverSheetView
             //    Needed to avoid notifications to overlap the radius
             */
            target.children[0].view.clipsToBounds = true
            target.children[0].view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            target.children[0].view.layer.cornerCurve = .continuous
            target.children[0].view.layer.cornerRadius = prefPath?.cornerRadius ?? 0
            
        } else { orig.viewWillAppear(animated) }
    }
    
    func viewDidAppear(_ animated: Bool) {
        target.view.subviews[0].layer.cornerRadius = 0
        target.children[0].view.layer.cornerRadius = 0
    }
    
    func viewWillDisappear(_ animated: Bool) {
        target.view.subviews[0].layer.cornerRadius = prefPath?.cornerRadius ?? 0
        target.children[0].view.layer.cornerRadius = prefPath?.cornerRadius ?? 0
    }
    
    func viewDidDisappear(_ animated: Bool) {
        target.view.subviews[0].layer.cornerRadius = 0
        target.children[0].view.layer.cornerRadius = 0
    }
}
