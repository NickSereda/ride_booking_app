import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class that provides access to environment variables.
abstract final class Env {
  static String get environment => dotenv.get('ENVIRONMENT', fallback: 'prod');
}
