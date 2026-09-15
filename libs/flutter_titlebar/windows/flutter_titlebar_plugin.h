#ifndef FLUTTER_PLUGIN_FLUTTER_TITLEBAR_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_TITLEBAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_titlebar {

class FlutterTitlebarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterTitlebarPlugin();

  virtual ~FlutterTitlebarPlugin();

  // Disallow copy and assign.
  FlutterTitlebarPlugin(const FlutterTitlebarPlugin&) = delete;
  FlutterTitlebarPlugin& operator=(const FlutterTitlebarPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_titlebar

#endif  // FLUTTER_PLUGIN_FLUTTER_TITLEBAR_PLUGIN_H_
