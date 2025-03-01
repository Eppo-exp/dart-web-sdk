import 'dart:js_interop';

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
