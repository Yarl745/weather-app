import 'package:fimber/fimber.dart';

enum Configs {
  dev,
  prod,
}

abstract class AppConfig {
  AppConfig._({
    required this.apiHostName,
    required this.googleApiKey,
    required this.openWeatherMapApiKey,
    required this.mapboxAccessToken,
    required this.customMapStylePath,
    required this.isProductionEnvironment,
  });

  final String apiHostName;
  final String googleApiKey;
  final String openWeatherMapApiKey;
  final String mapboxAccessToken;
  final String customMapStylePath;
  final bool isProductionEnvironment;

  String get api => 'https://$apiHostName';

  static AppConfig get init => _getForFlavor;

  static AppConfig get _getForFlavor {
    Configs flavor = Configs.values.firstWhere(
      (e) => e.toString() == "Configs.${const String.fromEnvironment('envFlavour', defaultValue: 'prod')}",
    );

    switch (flavor) {
      case Configs.dev:
        Fimber.plantTree(DebugTree());
        Fimber.e('debug mode');
        return DevConfig();
      case Configs.prod:
        Fimber.e('release mode');
        return ProdConfig();
      default:
        throw UnimplementedError();
    }
  }
}

class DevConfig extends AppConfig {
  DevConfig()
      : super._(
          apiHostName: 'dev.com',
          googleApiKey: 'AIzaSyAYyr2nLsgl-VQsTWOdkeUo5wh8PasWl_U',
          openWeatherMapApiKey: 'd93dfa88ffb8361a46b89aa7f5447684',
          isProductionEnvironment: false,
          mapboxAccessToken:
              'pk.eyJ1IjoiamFyZWRrb3BhbG8iLCJhIjoiY2xuZnJkMXY3MGN3bDJpbWlhZ3lzenBjdCJ9.frn6WJVQJW09G_luUvhgpg',
          customMapStylePath: 'mapbox://styles/jaredkopalo/clnog92sg00ba01qq4v71an8n',
        );
}

class ProdConfig extends AppConfig {
  ProdConfig()
      : super._(
          apiHostName: 'prod.com',
          googleApiKey: 'AIzaSyAYyr2nLsgl-VQsTWOdkeUo5wh8PasWl_U',
          openWeatherMapApiKey: 'd93dfa88ffb8361a46b89aa7f5447684',
          isProductionEnvironment: true,
          mapboxAccessToken:
              'pk.eyJ1IjoiamFyZWRrb3BhbG8iLCJhIjoiY2xuZnJkMXY3MGN3bDJpbWlhZ3lzenBjdCJ9.frn6WJVQJW09G_luUvhgpg',
          customMapStylePath: 'mapbox://styles/jaredkopalo/clnog92sg00ba01qq4v71an8n',
        );
}
