# Eppo SDK for Flutter Web

[Eppo](https://www.geteppo.com/) is a modular flagging and experimentation analysis tool.

This is a Dart wrapper for the Eppo JavaScript SDK that enables feature flagging and experimentation in Flutter web applications.

This package provides interoperability with the [Eppo JavaScript SDK](https://github.com/Eppo-exp/js-client-sdk) through Dart's `js_interop` functionality.

## Getting Started

Refer to our [SDK documentation](https://docs.geteppo.com/sdks/client-sdks/flutter-web) for how to install and use the SDK.

## Features

- Feature gates
- Kill switches
- Progressive rollouts
- A/B/n experiments
- Mutually exclusive experiments (Layers)
- Dynamic configuration

## Development

### Testing

This package includes GitHub Actions workflows for automated testing and publishing:

- **Testing**: Runs on every push to main and on pull requests
  - Verifies code formatting
  - Runs static analysis
  - Executes all tests

### Publishing

To publish a new version:

1. Update the version in `pubspec.yaml`
2. Update the `CHANGELOG.md` with the changes
3. Create a new GitHub release:
   - Go to the repository's "Releases" section
   - Click "Draft a new release"
   - Create a new tag in the format `v1.2.3`
   - Add release notes (can be copied from CHANGELOG.md)
   - Publish the release
4. The GitHub Actions workflow will automatically publish the package to pub.dev
