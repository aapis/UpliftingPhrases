//
//  UpliftingPhrasesApp.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI
import CoreData

@main
struct UpliftingPhrasesApp: App {
//    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            let model = QuotesModel()
            HomeView().environmentObject(model)
        }
//        .onChange(of: scenePhase) { (newScenePhase) in
//            switch newScenePhase {
//            case .active:
//                print("active")
//
//            case .inactive:
//                print("inactive")
//            case .background:
//                print("background")
//            @unknown default:
//                print("unknown")
//            }
//        }
    }
}

struct UpliftingPhrasesApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
