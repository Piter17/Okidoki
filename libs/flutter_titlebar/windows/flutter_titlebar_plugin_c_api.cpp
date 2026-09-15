#include "include/flutter_titlebar/flutter_titlebar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_titlebar_plugin.h"

void FlutterTitlebarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_titlebar::FlutterTitlebarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
