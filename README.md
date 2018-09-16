HotKey
======
Eonil, 2018

Provides a way to hook into global key-combination. 
The feature has been existed in macOS from Carbon era, but never been exposed to Cocoa.
Therfore, this library must use Carbon. 
Fortunrately, Apple is exposing required Carbon functions to Swift, this library could be 
written in Swift. And as exposed by Apple, in my opinion, they're willing to continue support
for these functions.

How to Use
--------------
There're only two major types: `HotKey` and `KeyCombo`.
`HotKey` is the manager object. You are supposed to use this object. 

1. Set `HotKey.shared.delegate` to your handler code.
2. Make a `KeyCombo` instance and add it to `HotKey.shared`.

Here's an example to watch for a key-combo.

    HotKey.shared.delegate = { k in print("Hot-key received: \(k)") }
    try! HotKey.shared.watch(demoCommandA)

To unwatch a combo...

    try! HotKey.shared.unwatch(demoCommandA)

Full example.

    import Carbon
    import Cocoa

    @NSApplicationMain
    class AppDelegate: NSObject, NSApplicationDelegate {
        func applicationDidFinishLaunching(_ aNotification: Notification) {
            HotKey.shared.delegate = { k in print("Hot-key received: \(k)") }
            try! HotKey.shared.watch(demoCommandA)
        }
        func applicationWillTerminate(_ aNotification: Notification) {
            try! HotKey.shared.unwatch(demoCommandA)
        }
    }
    private let demoCommandA = KeyCombo(
                modifierFlags: [.command],
                keyCode: UInt16(kVK_ANSI_A))




Design Choices
-------------------
- Any detectable errors must be handled.
- Any recoverable errors must be recovered implicitly.
- Throw any irrecoverable errors.
- If an error has been detected, irrecoverable, inhandlable, 
  or innotifiable, then it must be reported at last resort.
  See `Report` type for details.

- `KeyComb` is just a value to identify each key-combinations.
- `HotKey` is the central manager, and the only reference-type
  which can absorb and emit messages. You are supposed to
  start from this class.



Credits
---------
This library is mostly a Swift port of an Objective-C framework 
[`MASShortcut`](https://github.com/shpakovski/MASShortcut) written by *Vadim Shpakovski*. 
Re-written as a Swift static library with minimal feature set.
I think this is no problem because `MASShortCut` is licensed under 
"BSD 2-Clause" license.



License
----------
Licensed under "MIT License".
Contributions will also be under same license.
