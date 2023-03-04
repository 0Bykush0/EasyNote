//
//  EasyNoteApp.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 4.03.2023.
//

import SwiftUI

@main
struct EasyNoteApp: App {
    
    @StateObject var listViewModal: ListViewModal = ListViewModal()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModal)
        }
    }
}
