//
//  aZendaApp.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI

@main
struct aZendaApp: App {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor( backgroundColor)
        UINavigationBar.appearance().barTintColor = UIColor( backgroundColor)
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
