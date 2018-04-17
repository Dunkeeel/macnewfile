//
//  AppDelegate.swift
//  MacNewFile
//
//  Created by 陈冰峰 on 01/09/2017.
//  Copyright © 2017 MajorEssense. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // instantly terminate the app, since it's not needed
        NSApplication.shared.terminate(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

