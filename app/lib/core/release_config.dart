class ReleaseConfig {
  static const serverBaseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: "https://api-dev.okidoki.fun/",
  );

  static const appBaseUrl = String.fromEnvironment(
    'APP_URL',
    defaultValue: "https://test.okidoki.fun/",
  );

  static const signalRUrl = "${serverBaseUrl}hubs/realtime";

  static String getInviteUrl(String code) => "${appBaseUrl}invite/$code";
}
