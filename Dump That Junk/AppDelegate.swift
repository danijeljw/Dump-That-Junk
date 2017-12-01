//
//  AppDelegate.swift
//  Dump That Junk
//
//  Created by Danijel-James Wynyard on 1/12/17.
//  Copyright © 2017 Danijel-James Wynyard. All rights reserved.
//

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
    

    
    @IBAction func talk(_ sender: NSButton) {
        let path = "/usr/bin/say"
        let textToSay = sayThisTextField.stringValue
        let arguments = [textToSay]
        
        sender.isEnabled = false
        
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
        
        sender.isEnabled = true
    }
    
}

