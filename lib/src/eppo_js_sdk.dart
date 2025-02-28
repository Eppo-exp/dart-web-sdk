import 'dart:js_interop';

/// This file contains the Dart bindings for the Eppo JavaScript SDK.
///
/// https://github.com/Eppo-exp/js-client-sdk
/// https://github.com/Eppo-exp/js-client-sdk-common

/// The global Eppo JavaScript SDK object.
///
/// This is the entry point for interacting with the Eppo SDK.
/// It provides methods for initialization and getting client instances.
@JS('eppo')
external EppoJS get eppo;

/// Represents the Eppo JavaScript SDK object.
///
/// This class provides the core functionality of the Eppo SDK.
@JS()
@staticInterop
class EppoJS {
  external factory EppoJS();
}

/// Extension methods for the EppoJS class.
extension EppoJSExtension on EppoJS {
  /// Initializes the Eppo SDK with the provided configuration.
  ///
  /// Returns a Promise that resolves when initialization is complete.
  external JSPromise<JSAny> init(JSAny config);

  /// Gets an instance of the Eppo client for accessing feature flags.
  ///
  /// Use this method after initialization to get a client for retrieving
  /// feature flag values.
  external EppoClient getInstance();
}

/// Configuration for Eppo SDK initialization.
///
/// This class represents the configuration options for initializing the Eppo SDK.
@JS()
@staticInterop
@anonymous
class EppoConfig {
  /// Creates a new configuration object for Eppo SDK initialization.
  ///
  /// [apiKey] is required and should be your Eppo API key.
  /// [assignmentLogger] is an optional custom logger for assignment events.
  /// [maxCacheAgeSeconds] is an optional setting for cache expiration.
  external factory EppoConfig({
    required String apiKey,
    JSAny? assignmentLogger,
    num? maxCacheAgeSeconds,
  });
}

// Allocation Evaluation interface
@JS()
@staticInterop
@anonymous
class AllocationEvaluation {
  external factory AllocationEvaluation();
}

// Extension methods for AllocationEvaluation
extension AllocationEvaluationExtension on AllocationEvaluation {
  external String? get key;
  external String? get allocationEvaluationCode;
  external int? get orderPosition;
}

// Rule interface
@JS()
@staticInterop
@anonymous
class Rule {
  external factory Rule();
}

// Flag Evaluation Details interface
@JS()
@staticInterop
@anonymous
class FlagEvaluationDetails {
  external factory FlagEvaluationDetails();
}

// Extension methods for FlagEvaluationDetails
extension FlagEvaluationDetailsExtension on FlagEvaluationDetails {
  external String? get environmentName;
  external String? get flagEvaluationCode;
  external String? get flagEvaluationDescription;
  external String? get variationKey;
  external JSAny? get variationValue;
  external String? get banditKey;
  external String? get banditAction;
  external String? get configFetchedAt;
  external String? get configPublishedAt;
  external Rule? get matchedRule;
  external AllocationEvaluation? get matchedAllocation;
  external JSArray<JSAny>? get unmatchedAllocations;
  external JSArray<JSAny>? get unevaluatedAllocations;
}

// Assignment details interface
@JS()
@staticInterop
@anonymous
class AssignmentDetails {
  external factory AssignmentDetails();
}

// Extension methods for AssignmentDetails
extension AssignmentDetailsExtension on AssignmentDetails {
  external JSAny? get variation;
  external String? get action;
  external FlagEvaluationDetails get evaluationDetails;
}

/// Represents an instance of the Eppo client.
///
/// This class provides methods for retrieving feature flag values
/// of different types for a given subject (user).
@JS()
@staticInterop
class EppoClient {
  external factory EppoClient();
}

/// Extension methods for the EppoClient class.
extension EppoClientExtension on EppoClient {
  /// Gets a string feature flag value for the specified subject.
  ///
  /// [flagKey] is the identifier of the feature flag.
  /// [subjectKey] is the identifier of the subject (user).
  /// [subjectAttributes] is an optional object containing subject attributes for targeting.
  /// [defaultValue] is an optional default value to return if the flag is not found.
  external String? getStringAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    String? defaultValue,
  ]);

  /// Gets detailed information about a string feature flag assignment.
  ///
  /// This method returns not just the flag value but also evaluation details
  /// that can be useful for debugging and analytics.
  external AssignmentDetails getStringAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    String defaultValue,
  );

  /// Gets a boolean feature flag value for the specified subject.
  external bool? getBooleanAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    bool? defaultValue,
  ]);

  /// Gets detailed information about a boolean feature flag assignment.
  external AssignmentDetails getBooleanAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    bool defaultValue,
  );

  /// Gets a JSON feature flag value for the specified subject.
  external JSAny? getJSONAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    JSAny? defaultValue,
  ]);

  /// Gets detailed information about a JSON feature flag assignment.
  external AssignmentDetails getJSONAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    JSAny defaultValue,
  );

  /// Gets a numeric feature flag value for the specified subject.
  external num? getNumericAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    num? defaultValue,
  ]);

  /// Gets detailed information about a numeric feature flag assignment.
  external AssignmentDetails getNumericAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    num defaultValue,
  );

  /// Gets an integer feature flag value for the specified subject.
  external int? getIntegerAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    int? defaultValue,
  ]);

  /// Gets detailed information about an integer feature flag assignment.
  external AssignmentDetails getIntegerAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    int defaultValue,
  );
}
