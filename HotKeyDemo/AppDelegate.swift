//
//  AppDelegate.swift
//  HotKeyDemo
//
//  Created by Henry on 2018/09/16.
//  Copyright © 2018 Eonil. All rights reserved.
//

import Carbon
import Cocoa
import HotKey

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let demoCommandA = KeyCombo(
        modifierFlags: [.command],
        keyCode: UInt16(kVK_ANSI_A))
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        HotKey.shared.delegate = { k in print("Hot-key received: \(k)") }
        try! HotKey.shared.watch([.command] + UInt16(kVK_ANSI_1))
        try! HotKey.shared.watch([.command] + UInt16(kVK_ANSI_2))
        try! HotKey.shared.watch([.command] + UInt16(kVK_ANSI_3))
        try! HotKey.shared.watch([.command] + UInt16(kVK_ANSI_A))
    }
}
