
## Prerequisites

To set up and run the project, ensure the following prerequisites are met:

### Environment Configuration

Create a `.env` file in the project root with the following content:

```
ENVIRONMENT=dev
```

This file configures environment-specific variables, such as active environment.

### Generated Files

Generated files are included in the repository for convenience. If you encounter issues, regenerate them with:

```bash
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

### Setting up the Maps API Key

### Adnroid

**Create a local.properties file in /android diectory** (usually already added by default)
```
MAPS_API_KEY=your_api_key_here
```
### iOS

**Create of go to ios/Flutter/Debug.xcconfig and  ios/Flutter/Release.xcconfig files**:
```
// Debug.xcconfig
MAPS_API_KEY=your_api_key_here
```

## Tests

To run tests run:

```
flutter test
```

## Limitations

This Ride Booking Demo App is a proof-of-concept built for development purposes. Below are its core limitations:

1.  **Development-Only Setup**
    -   The current implementation uses a `DevRideBookingRepository` tailored for the development environment (`env: [Environment.dev]`). It relies on an in-memory data store (BehaviorSubject) instead of persistent storage or real APIs.
2.  **No User Authentication**
    -   Lacks user login and booking-to-user linking. Bookings are stored temporarily in memory and are not associated with any user identity.
3.  **Basic Address Handling**
    -   Returns latitude/longitude as addresses. 