class AppConfig {
  static var instance = AppConfig._(true);
  final bool isDemo;

  AppConfig._(this.isDemo);
}
