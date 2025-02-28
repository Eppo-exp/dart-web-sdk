import 'dart:js_interop';
import 'eppo_client.dart';

/// This file contains the Dart bindings for the Eppo JavaScript SDK precomputed client.
///
/// https://github.com/Eppo-exp/js-client-sdk
/// https://github.com/Eppo-exp/js-client-sdk-common

/// Extension methods for the EppoJS class related to precomputed client.
extension EppoJSPrecomputedExtension on EppoJS {
  /// Gets an instance of the Eppo precomputed client.
  ///
  /// Use this method after calling precomputedInit() to initialize the client.
  external EppoPrecomputedClient getPrecomputedInstance();

  /// Initializes the Eppo precomputed client with configuration parameters.
  ///
  /// Returns a Promise that resolves to the precomputed client instance.
  external JSPromise<JSAny> precomputedInit(JSAny config);

  /// Initializes the Eppo precomputed client with synchronous configuration.
  ///
  /// Use this for cases where precomputed assignments are available from an external process.
  external EppoPrecomputedClient offlinePrecomputedInit(JSAny config);
}

/// Configuration for Eppo precomputed client initialization.
@JS()
@staticInterop
@anonymous
class EppoPrecomputedConfig {
  /// Creates a new configuration object for Eppo precomputed client initialization.
  external factory EppoPrecomputedConfig({
    required String apiKey,
    required JSAny precompute,
    String? baseUrl,
    num? requestTimeoutMs,
    num? numInitialRequestRetries,
    num? numPollRequestRetries,
    num? pollingIntervalMs,
    bool? pollAfterSuccessfulInitialization,
    bool? pollAfterFailedInitialization,
    bool? skipInitialRequest,
    JSAny? assignmentLogger,
    JSAny? banditLogger,
  });
}

/// Configuration for Eppo precomputed client offline initialization.
@JS()
@staticInterop
@anonymous
class EppoPrecomputedConfigSync {
  /// Creates a new configuration object for Eppo precomputed client offline initialization.
  external factory EppoPrecomputedConfigSync({
    required String precomputedConfiguration,
    JSAny? assignmentLogger,
    JSAny? banditLogger,
    bool? throwOnFailedInitialization,
  });
}

/// Precompute configuration for precomputed client.
@JS()
@staticInterop
@anonymous
class PrecomputeConfig {
  external factory PrecomputeConfig({
    required String subjectKey,
    JSAny? subjectAttributes,
    JSAny? banditActions,
  });
}

/// Represents an instance of the Eppo precomputed client.
///
/// This class provides methods for retrieving precomputed feature flag values.
@JS()
@staticInterop
class EppoPrecomputedClient {
  external factory EppoPrecomputedClient();
}

/// Extension methods for the EppoPrecomputedClient class.
extension EppoPrecomputedClientExtension on EppoPrecomputedClient {
  /// Gets a string feature flag value.
  external String getStringAssignment(
    String flagKey,
    String defaultValue,
  );

  /// Gets a boolean feature flag value.
  external bool getBooleanAssignment(
    String flagKey,
    bool defaultValue,
  );

  /// Gets a numeric feature flag value.
  external num getNumericAssignment(
    String flagKey,
    num defaultValue,
  );

  /// Gets an integer feature flag value.
  external int getIntegerAssignment(
    String flagKey,
    int defaultValue,
  );

  /// Gets a JSON feature flag value.
  external JSAny getJSONAssignment(
    String flagKey,
    JSAny defaultValue,
  );

  /// Gets a bandit action.
  external JSAny getBanditAction(
    String flagKey,
    String defaultValue,
  );

  /// Gets detailed information about a bandit action assignment.
  external AssignmentDetails getBanditActionDetails(
    String flagKey,
    String defaultValue,
  );
}
