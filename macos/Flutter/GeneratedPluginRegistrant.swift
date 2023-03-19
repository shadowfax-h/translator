//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import clipboard_watcher
import hotkey_manager
import screen_retriever
import screen_text_extractor
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  ClipboardWatcherPlugin.register(with: registry.registrar(forPlugin: "ClipboardWatcherPlugin"))
  HotkeyManagerPlugin.register(with: registry.registrar(forPlugin: "HotkeyManagerPlugin"))
  ScreenRetrieverPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverPlugin"))
  ScreenTextExtractorPlugin.register(with: registry.registrar(forPlugin: "ScreenTextExtractorPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
