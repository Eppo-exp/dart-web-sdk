/// Eppo SDK for Flutter Web
///
/// A Dart wrapper for the Eppo JavaScript SDK that enables feature flagging
/// and experimentation in Flutter web applications.
///
/// This package provides interoperability with the Eppo JavaScript SDK through
/// Dart's js_interop functionality, allowing you to:
///
/// - Initialize the Eppo SDK with your API key
/// - Retrieve feature flag values of different types (string, boolean, numeric, JSON)
/// - Access detailed assignment information for analytics and debugging
///
/// ## Basic Usage
///
/// ```dart
/// import 'package:eppo_web_sdk/eppo_web_sdk.dart';
/// import 'dart:js_interop';
///
/// // Initialize the SDK
/// final config = EppoConfig(apiKey: 'your-api-key');
/// await eppo.init(config.toJS).toDart;
///
/// // Get an instance of the client
/// final client = eppo.getInstance();
///
/// // Get a feature flag value
/// final variation = client.getStringAssignment('flag-key', 'user-id');
/// ```
///
/// For more information about Eppo, visit [geteppo.com](https://geteppo.com).

library;

export 'src/eppo_js_sdk.dart';
