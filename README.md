# CleverTap Sample App (SwiftUI)

Minimal SwiftUI app for a CleverTap Technical Onboarding assessment.

- CleverTap iOS SDK via Swift Package Manager
- `AppDelegate` via `@UIApplicationDelegateAdaptor`
- `CleverTap.autoIntegrate()` at launch
- Debug logs enabled
- APNs registration with `UNUserNotificationCenter`
- APNs device token passed to CleverTap
- "View Product" button that identifies the user and records a `Product Viewed` event

## Assessment Requirements Implemented

- [x] CleverTap iOS SDK integration
- [x] User identification using the required email format
- [x] `Product Viewed` event with Product ID, Image and Name
- [x] APNs device registration
- [x] Push Notification campaign tested on a physical iPhone
- [x] In-App campaign triggered by `App Launched`

Campaign delivery videos are provided separately with the assessment submission.

## Files

| File | Purpose |
| --- | --- |
| `CleverTapSample/CleverTapSampleApp.swift` | SwiftUI app entry point + `@UIApplicationDelegateAdaptor` |
| `CleverTapSample/AppDelegate.swift` | CleverTap init, debug logs, APNs registration and token forwarding |
| `CleverTapSample/ContentView.swift` | "View Product" button, `onUserLogin`, `recordEvent` |
| `CleverTapSample/Info.plist` | CleverTap credentials and background mode keys |
| `CleverTapSample/CleverTapSample.entitlements` | Push Notifications entitlement |
| `project.yml` | XcodeGen project definition with the SPM package |

## Setup

1. **Add your CleverTap credentials**

   In `CleverTapSample/Info.plist`, replace:

   - `YOUR_PROJECT_ID` with your CleverTap Account ID
   - `YOUR_PROJECT_TOKEN` with your CleverTap Account Token

   These are found in the CleverTap dashboard under **Settings → Integration Details**.
   The same two keys are read by `CleverTap.autoIntegrate()`.

2. **Test email**

   The app identifies the user with `clevertap+duongnh.612@gmail.com`
   (see `CleverTapSample/ContentView.swift`).

3. **Open the project**

   The generated `CleverTapSample.xcodeproj` is included. If you change
   `project.yml`, regenerate it with:

   ```sh
   xcodegen generate
   ```

4. **Select a signing team**

   In Xcode, select the `CleverTapSample` target → **Signing & Capabilities**,
   choose your Apple Developer team, and change the bundle identifier if needed.

5. **Enable capabilities**

   On the same tab, add:

   - **Push Notifications**
   - **Background Modes** → check **Remote notifications**

   The entitlements file already contains `aps-environment = development`, and
   `Info.plist` already contains `UIBackgroundModes = remote-notification`.
   Xcode must still have a valid provisioning profile for the capability.

6. **Run on a physical device**

   Push notifications and a real APNs token require a physical iPhone. The
   simulator only receives simulated push payloads.

7. **Upload your APNs key to CleverTap**

   In the CleverTap dashboard under **Settings → Channels → Push**, upload your
   APNs Auth Key (`.p8`), Key ID, and Team ID. **Do not commit the `.p8` file
   or any Apple private keys to this repository.**

## Verify

1. Launch the app and accept the notification permission prompt.
2. Check the Xcode console for CleverTap debug logs and the APNs token.
3. Tap **View Product**.
4. In the CleverTap dashboard, confirm:
   - The user is identified by the email you configured.
   - A `Product Viewed` event was recorded with `Product ID`, `Product Image`,
     and `Product Name` properties.
5. Send a test push from the CleverTap dashboard to confirm the device token
   was registered.

## Notes

- All credentials in this repository are placeholders.
- `CleverTapAccountID`/`CleverTapToken` are read from `Info.plist` by
  `autoIntegrate()`; no credentials are hardcoded in Swift.
- The sample intentionally keeps everything in the view and app delegate — no
  extra architecture layers.
