import 'dart:js_interop';
import 'eppo_js.dart';

/// This file contains the Dart bindings for the Eppo JavaScript SDK client.
///
/// https://github.com/Eppo-exp/js-client-sdk
/// https://github.com/Eppo-exp/js-client-sdk-common
///
/// Methods not implemented:
/// - getExperimentContainerEntry
/// - stopPolling
/// - fetchFlagConfigurations
/// - offline init
/// - event ingestion

/// Extension methods for the EppoJS class.
extension EppoJSExtension on EppoJS {
  /// Initializes the Eppo SDK with the provided configuration.
  ///
  /// Returns a Promise that resolves when initialization is complete.
  external JSPromise<JSAny?> init(EppoConfig config);

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
  /// [apiKey] is required and should be your Eppo SDK key.
  /// [assignmentLogger] is an optional custom logger for assignment events.
  /// [banditLogger] is an optional custom logger for bandit events.
  /// [maxCacheAgeSeconds] is an optional maximum cache age in seconds.
  /// [updateOnFetch] is an optional flag indicating whether to update cache on fetch.
  /// [requestTimeoutMs] is an optional request timeout in milliseconds.
  /// [numInitialRequestRetries] is an optional number of initial request retries.
  /// [numPollRequestRetries] is an optional number of poll request retries.
  /// [pollingIntervalMs] is an optional polling interval in milliseconds.
  /// [pollAfterSuccessfulInitialization] is an optional flag indicating whether to poll after successful initialization.
  /// [pollAfterFailedInitialization] is an optional flag indicating whether to poll after failed initialization.
  /// [skipInitialRequest] is an optional flag indicating whether to skip initial request.
  /// [baseUrl] is an optional base URL for the Eppo SDK.
  /// [useExpiredCache] is an optional flag indicating whether to use expired cache.
  /// [forceReinitialize] is an optional flag indicating whether to force reinitialize.
  external factory EppoConfig({
    required String apiKey,
    AssignmentLogger? assignmentLogger,
    BanditLogger? banditLogger,
    num? maxCacheAgeSeconds,
    bool? updateOnFetch,
    num? requestTimeoutMs,
    num? numInitialRequestRetries,
    num? numPollRequestRetries,
    num? pollingIntervalMs,
    bool? pollAfterSuccessfulInitialization,
    bool? pollAfterFailedInitialization,
    bool? skipInitialRequest,
    String? baseUrl,
    bool? useExpiredCache,
    bool? forceReinitialize,
  });
}

/// Interface for persistent store.
@JS()
@staticInterop
@anonymous
class PersistentStore {
  external factory PersistentStore();
}

/// Interface for assignment logger.
@JS()
@staticInterop
@anonymous
class AssignmentLogger {
  /// Creates a new assignment logger.
  ///
  /// Implement this interface to log variation assignments to your data warehouse.
  /// The logger will be called with an assignment event when a subject is assigned to a variation.
  ///
  /// Example usage:
  /// ```dart
  /// AssignmentLogger(
  ///   logAssignment: ((JSAny event) {
  ///     final typedEvent = event as AssignmentEvent;
  ///     // Your logging logic here
  ///   }).toJS,
  /// )
  /// ```
  external factory AssignmentLogger({required JSFunction logAssignment});
}

/// Represents an assignment event.
@JS()
@staticInterop
@anonymous
class AssignmentEvent {
  external factory AssignmentEvent();
}

/// Extension methods for AssignmentEvent.
extension AssignmentEventExtension on AssignmentEvent {
  external String? get allocation;
  external String? get experiment;
  external String get featureFlag;
  external String? get variation;
  external String get subject;
  external String get timestamp;
  external JSAny get subjectAttributes;
  external String get format;
  external FlagEvaluationDetails? get evaluationDetails;
}

/// Interface for bandit logger.
@JS()
@staticInterop
@anonymous
class BanditLogger {
  /// Creates a new bandit logger.
  ///
  /// Implement this interface to log bandit actions to your data warehouse.
  /// The logger will be called with a bandit event when a subject is assigned to an action.
  ///
  /// Example usage:
  /// ```dart
  /// BanditLogger(
  ///   logBanditEvent: ((JSAny event) {
  ///     final typedEvent = event as BanditEvent;
  ///     // Your logging logic here
  ///   }).toJS,
  /// )
  /// ```
  external factory BanditLogger({required JSFunction logBanditEvent});
}

/// Represents a bandit event.
@JS()
@staticInterop
@anonymous
class BanditEvent {
  external factory BanditEvent();
}

/// Extension methods for BanditEvent.
extension BanditEventExtension on BanditEvent {
  external String get banditKey;
  external String get action;
  external String get subject;
  external String get timestamp;
  external JSAny get subjectAttributes;
  external FlagEvaluationDetails? get evaluationDetails;
}

/// Type for attribute values in subject attributes.
/// Can be String, num, bool, or List&lt;dynamic&gt;.
typedef AttributeType = dynamic;

/// Subject attributes for targeting.
@JS()
@staticInterop
@anonymous
class SubjectAttributes {
  external factory SubjectAttributes();
}

/// Bandit subject attributes for targeting.
@JS()
@staticInterop
@anonymous
class BanditSubjectAttributes {
  external factory BanditSubjectAttributes();
}

/// Bandit actions configuration.
@JS()
@staticInterop
@anonymous
class BanditActions {
  external factory BanditActions();
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
class AssignmentDetails<T extends JSAny?> {
  external factory AssignmentDetails();
}

// Extension methods for AssignmentDetails
extension AssignmentDetailsExtension<T extends JSAny?> on AssignmentDetails<T> {
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
  external String getStringAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    String? defaultValue,
  ]);

  /// Gets detailed information about a string feature flag assignment.
  ///
  /// This method returns not just the flag value but also evaluation details
  /// that can be useful for debugging and analytics.
  external AssignmentDetails<JSString> getStringAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    String defaultValue,
  );

  /// Gets a boolean feature flag value for the specified subject.
  external bool getBooleanAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    bool? defaultValue,
  ]);

  /// Gets detailed information about a boolean feature flag assignment.
  external AssignmentDetails<JSBoolean> getBooleanAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    bool defaultValue,
  );

  /// Gets a JSON feature flag value for the specified subject.
  external JSAny getJSONAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    JSAny? defaultValue,
  ]);

  /// Gets detailed information about a JSON feature flag assignment.
  external AssignmentDetails<JSObject> getJSONAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    JSAny defaultValue,
  );

  /// Gets a numeric feature flag value for the specified subject.
  external num getNumericAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    num? defaultValue,
  ]);

  /// Gets detailed information about a numeric feature flag assignment.
  external AssignmentDetails<JSNumber> getNumericAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    num defaultValue,
  );

  /// Gets an integer feature flag value for the specified subject.
  external int getIntegerAssignment(
    String flagKey,
    String subjectKey, [
    JSAny? subjectAttributes,
    int? defaultValue,
  ]);

  /// Gets detailed information about an integer feature flag assignment.
  external AssignmentDetails<JSNumber> getIntegerAssignmentDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    int defaultValue,
  );

  /// Gets a bandit action for the specified subject.
  external AssignmentDetails<JSString> getBanditAction(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    JSAny actions,
    String defaultValue,
  );

  /// Gets detailed information about a bandit action assignment.
  external AssignmentDetails<JSString> getBanditActionDetails(
    String flagKey,
    String subjectKey,
    JSAny subjectAttributes,
    JSAny actions,
    String defaultValue,
  );
}
