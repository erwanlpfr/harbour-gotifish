# Gotifish - Sailfish OS

A native Sailfish OS client for Gotify, providing real-time push notifications and message management for self-hosted Gotify servers.

| ⚠️ Work in progress

## Features

- **Real-time Notifications**: Instant push notifications via WebSocket connections
- **Message History**: View and manage received messages with filtering options
- **Server Management**: Connect to multiple Gotify servers with secure authentication
- **Application Management**: Organize notifications by different applications
- **Settings**: Configure connection preferences and notification behavior

## Technology

Built with Qt 5.6, QML, and native Sailfish OS components. Uses WebSocket connections for real-time updates and integrates with the Gotify REST API.

## Installation

### From Sailfish OS Store

Available on Sailfish OS Store (Jolla Store) - coming soon

### From Source

For building from source, you'll need the Sailfish OS SDK. Follow the official Sailfish OS documentation:

1. **Install Sailfish OS SDK**: See [Sailfish OS SDK Installation Guide](https://sailfishos.org/wiki/Sailfish_OS_SDK)
2. **Set up Build Environment**: Follow the [Building Applications](https://sailfishos.org/wiki/Building_applications) guide

For detailed build instructions, refer to the [Sailfish OS Development Documentation](https://sailfishos.org/wiki/Documentation).

## Gotify Server Setup

Gotifish requires a Gotify server to connect to. To set up your own server:

1. **Install Gotify Server**: Follow the [Gotify Server Documentation](https://gotify.net/docs/install)
2. **Create Application**: Generate an application token in the Gotify web interface
3. **Configure Client**: Add your server URL and application token in Gotifish settings

For self-hosting options, see the [Gotify Docker setup](https://gotify.net/docs/install#docker).

## Dependencies

- Qt 5.6+
- Sailfish OS SDK
- Sailfish Silica
- Network connectivity for Gotify server communication

## License

AGPL-3.0

## Contributing

Contributions welcome! Please submit pull requests or open issues for bugs, features, or translations.

## Problems, Suggestions

If you encounter any bug in the Gotifish app, you can report it here in an issue. You can also check the issues list, maybe your bug has already been reported.

## Related Projects

- **[Gotify Server](https://github.com/gotify/server)**: The official Go-based Gotify server
- **[Gotify Android](https://github.com/gotify/android)**: Official Android client
- **[Gotify CLI](https://github.com/gotify/cli)**: Command-line client
- **[OPAL Libraries](https://github.com/Pretty-SFOS/opal)**: UI components for Sailfish OS

## Development

### Setup

Install Sailfish SDK and configure build target:

```bash
# Set build target
sfdk config target=SailfishOS-5.0.0.62-aarch64

# Configure device
sfdk config device="Your Device Name"
```

### Build

```bash
# Full build
sfdk build

# Individual steps
sfdk qmake .
sfdk make
sfdk package
```

### Deploy

```bash
# Deploy to device
sfdk deploy --sdk

# Start application manually
ssh defaultuser@192.168.2.15 "invoker --type=silica-qt5 /usr/bin/harbour-gotifish"
```

### Lint

```bash
# Validate RPM package
sfdk check

# Check specific RPM
rpmlint RPMS/harbour-gotifish-*.rpm
```

## Thanks

- Gotify team for the excellent push notification server
- OPAL Project for UI components
- Sailfish OS community
- All contributors and testers
