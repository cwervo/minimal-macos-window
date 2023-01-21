// From: https://stackoverflow.com/questions/30763229/display-window-on-osx-using-swift-without-xcode-or-nib
import Cocoa

let nsapp = NSApplication.shared
NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)

/*
  // It seems like this compiles in minimal_og but doesn't actually create a menu?
  let menubar = NSMenu()
  let appMenuItem = NSMenuItem()
  menubar.addItem(appMenuItem)
  NSApp.mainMenu = menubar

  let appMenu = NSMenu()
  // This is clever, but since we're removing the two places it's used below, can remove!
  let appName = ProcessInfo.processInfo.processName

  // Can remove this, enables quit via [⌘ + Q]
  let quitMenuItem = NSMenuItem.init(title:"Quit " + appName, action:#selector(NSApplication.terminate),keyEquivalent:"q")
  appMenu.addItem(quitMenuItem);
  appMenuItem.submenu = appMenu;
*/

let window = NSWindow.init( contentRect:NSMakeRect(0, 0, 200, 200), styleMask:.titled, backing:NSWindow.BackingStoreType.buffered, defer:false)
// Can remove this, but the window is going to be at the bottom left
// window.cascadeTopLeft(from:NSMakePoint(20, 20))

// Don't need window titles ¯\_(ツ)_/¯
// window.title = appName;

// Without this the window never appears
window.makeKeyAndOrderFront(nil)
// Okay, I could remove this, but having an app create a window but
// be in the background doesn't feel right.
NSApp.activate(ignoringOtherApps:true)

NSApp.run()