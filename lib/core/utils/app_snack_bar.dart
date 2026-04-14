import 'package:flutter/material.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:snackify/snackify.dart';
import 'package:snackify/tts_config.dart';

enum AppSnackType { success, error, warning, info }

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    String? subtitle,
    AppSnackType type = AppSnackType.info,
    Duration duration = const Duration(seconds: 5),
    LinearGradient? backgroundGradient,
    Color? backgroundColor,
    SnackPosition position = SnackPosition.bottom,
    bool persistent = false,
  }) {
    final config = _getConfig(type);

    Snackify.show(
      context: context,
      type: config.type,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
              : null,
      duration: duration,
      animationDuration: const Duration(milliseconds: 500),
      position: position,
      persistent: persistent,
      backgroundGradient: backgroundGradient ?? config.gradient,
      ttsConfig: TTSConfiguration(speakOnShow: false),
    );
  }

  static _SnackConfig _getConfig(AppSnackType type) {
    switch (type) {
      case AppSnackType.success:
        return _SnackConfig(
          type: SnackType.success,
          color: Colors.green,
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.greenAccent],
          ),
        );

      case AppSnackType.error:
        return _SnackConfig(
          type: SnackType.error,
          color: Colors.red,
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.redAccent],
          ),
        );

      case AppSnackType.warning:
        return _SnackConfig(
          type: SnackType.warning,
          color: Colors.orange,
          gradient: const LinearGradient(colors: [Colors.orange, Colors.amber]),
        );

      case AppSnackType.info:
        return _SnackConfig(
          type: SnackType.info,
          color: Colors.blue,
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        );
    }
  }
}

class _SnackConfig {
  final SnackType type;
  final Color color;
  final LinearGradient gradient;

  _SnackConfig({
    required this.type,
    required this.color,
    required this.gradient,
  });
}
