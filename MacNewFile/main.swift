//
//  main.swift
//  MacNewFile
//
//  Created by Tobias Dunkel on 17.04.18.
//  Copyright © 2018 MajorEssense. All rights reserved.
//

import Cocoa

let app = NSApplication.shared
let delegate = AppDelegate() //alloc main app's delegate class

app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
