//
//  AppDelegate.swift
//  MacNewFile
//
//  Created by 陈冰峰 on 01/09/2017.
//  Copyright © 2017 MajorEssense. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    var viewController: ViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        viewController = ViewController()
        window = NSWindow(contentViewController: viewController)
        window.contentView = viewController.view
        
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.styleMask.remove([.resizable])
        window.isMovableByWindowBackground = true
        
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
}

