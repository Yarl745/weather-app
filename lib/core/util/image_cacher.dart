import 'package:flutter/widgets.dart';

abstract class ImageCacher {
  static Future<void> preloadImages(List<String> imagePaths, BuildContext context) async {
    for (String path in imagePaths) {
      await precacheImage(ExactAssetImage(path), context);
    }
  }
}
