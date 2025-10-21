# CustomRouting – RouterView Guide

CustomRouting is a SwiftUI package that makes navigation simple and consistent across your application. It supports push navigation, sheets, full-screen covers, alerts, and custom modals — all managed through a shared Router system.

This README is formatted to display perfectly on GitHub.

---

## 📦 Installation

Add the package using **Swift Package Manager**:

1. In Xcode, go to **File > Add Packages…**
2. Enter the repository URL:

   ```
   https://github.com/dhiman10/CustomRouting.git
   ```
3. Select the package and add it to your project.

Then import it where needed:

```swift
import CustomRouting
import SwiftUI
```

---

## 🚀 Getting Started

Wrap your app's root view inside `RouterView`. This gives you access to the `router`, which handles all navigation actions.

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                ContentView(router: router)
            }
        }
    }
}
```

---

## 🌐 Accessing the Router in Views

In any child view, you can access the router using `@Environment`:

```swift
@Environment(\.router) private var router
```

---

## 🧭 Navigation Usage

### ✅ Push / Sheet / Full-Screen Navigation

```swift
router.showScreen(.push) { _ in
    ProfileView()
}

router.showScreen(.sheet) { _ in
    ProfileView()
}

router.showScreen(.fullScreenCover) { _ in
    ProfileView()
}

router.dismissScreen() // Dismiss push/sheet/fullScreen
```

---

### ✅ Alerts & Confirmation Dialogs

```swift
router.showAlert(
    .alert,
    title: "Alert Title",
    subtitle: "This is a message",
    buttons: nil
)

router.showAlert(
    .confirmationDialog,
    title: "Choose an Option",
    subtitle: "Pick one below",
    buttons: {
        AnyView(
            Group {
                Button("Option 1", action: {})
                Button("Option 2", action: {})
            }
        )
    }
)

router.dismissAlert()
```

---

### ✅ Custom Modals

```swift
router.showModal(
    backgroundColor: Color.black.opacity(0.5),
    transition: .move(edge: .bottom)
) {
    RoundedRectangle(cornerRadius: 30)
        .fill(Color.blue)
        .frame(height: 300)
        .onTapGesture {
            router.dismissModal()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
}

router.dismissModal()
```

---

## 📄 Example View (ProfileView)

```swift
struct ProfileView: View {
    @Environment(\.router) private var router

    var body: some View {
        List {
            Section(header: Text("Navigation")) {
                Button("Push") {
                    router.showScreen(.push) { _ in ProfileView() }
                }
                Button("Sheet") {
                    router.showScreen(.sheet) { _ in ProfileView() }
                }
                Button("Full Screen Cover") {
                    router.showScreen(.fullScreenCover) { _ in ProfileView() }
                }
                Button("Dismiss Screen") { router.dismissScreen() }
            }

            Section(header: Text("Alerts")) {
                Button("Show Alert") {
                    router.showAlert(.alert, title: "Hello", subtitle: "This is an alert")
                }
                Button("Dismiss Alert") { router.dismissAlert() }
            }

            Section(header: Text("Modal")) {
                Button("Show Modal") {
                    router.showModal(backgroundColor: Color.black.opacity(0.5)) {
                        Text("Tap to dismiss")
                            .padding()
                            .background(Color.white)
                            .onTapGesture { router.dismissModal() }
                    }
                }
                Button("Dismiss Modal") { router.dismissModal() }
            }
        }
        .navigationTitle("Routing Examples")
    }
}
```

---

## 📌 Router Summary Table

| Feature             | Method Example                                   |
| ------------------- | ------------------------------------------------ |
| Push Navigation     | `router.showScreen(.push) { View() }`            |
| Sheet               | `router.showScreen(.sheet) { View() }`           |
| Full Screen Cover   | `router.showScreen(.fullScreenCover) { View() }` |
| Dismiss Screen      | `router.dismissScreen()`                         |
| Alert               | `router.showAlert(.alert, ...)`                  |
| Confirmation Dialog | `router.showAlert(.confirmationDialog, ...)`     |
| Dismiss Alert       | `router.dismissAlert()`                          |
| Custom Modal        | `router.showModal(...) { View() }`               |
| Dismiss Modal       | `router.dismissModal()`                          |

---

## 🧪 Preview Support

```swift
#Preview {
    RouterView { _ in
        ProfileView()
    }
}
```

---

## 📄 License

This package is available under the MIT License. Feel free to use it in your own projects.

---

Enjoy using CustomRouting! 🎉
