// From: https://stackoverflow.com/questions/30763229/display-window-on-osx-using-swift-without-xcode-or-nib
import Cocoa

let nsapp = NSApplication.shared
NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)
let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)
NSApp.mainMenu = menubar
let appMenu = NSMenu()
let appName = ProcessInfo.processInfo.processName
let quitTitle = "Quit " + appName
let quitMenuItem = NSMenuItem.init(title:quitTitle,
  action:#selector(NSApplication.terminate),keyEquivalent:"q")
appMenu.addItem(quitMenuItem);
appMenuItem.submenu = appMenu;
let window = NSWindow.init(contentRect:NSMakeRect(0, 0, 200, 200),
    styleMask:.titled,backing:NSWindow.BackingStoreType.buffered,defer:false)
window.cascadeTopLeft(from:NSMakePoint(20,20))
window.title = appName;
window.makeKeyAndOrderFront(nil)
NSApp.activate(ignoringOtherApps:true)
NSApp.run()