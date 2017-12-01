//
//  AppDelegate.swift
//  Dump That Junk
//
//  Created by Danijel-James Wynyard on 1/12/17.
//  Copyright © 2017 Danijel-James Wynyard. All rights reserved.
//

//  Source code:
//  http://scriptingosx.com/2016/05/build-an-application-to-run-a-shell-command-in-xcode-and-swift-part-2/

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var sayThisTextField: NSTextField!
    
    @IBOutlet weak var sayProgress: NSProgressIndicator!
    
    @IBAction func talk(_ sender: NSButton) {
        let path = "/usr/bin/say"
        let textToSay = sayThisTextField.stringValue
        let arguments = [textToSay, "-v", "Alex"]
        
        sender.isEnabled = false
        sayProgress.startAnimation(self)
        
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
        
        sender.isEnabled = true
        sayProgress.stopAnimation(self)
    }
    
}

