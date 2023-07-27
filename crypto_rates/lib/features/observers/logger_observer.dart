import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// This observer displays which routes were opened and closed in the application
class LoggerObserver extends NavigatorObserver {
  LoggerObserver(this.logger);

  final Logger logger;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    _logRoute(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    _logRoute(route, isPush: false);
  }

  void _logRoute(Route route, {bool isPush = true}) {
    final messageBuffer = StringBuffer();
    messageBuffer.write(isPush ? 'Open' : 'Close');
    messageBuffer.write(' route named ');
    messageBuffer.write(route.settings.name ?? 'null');

    final args = route.settings.arguments;
    if (args != null) {
      messageBuffer.write('\nArguments: $args');
    }

    logger.d(messageBuffer.toString());
  }
}
