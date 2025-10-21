CustomRouting – RouterView Usage
CustomRouting is a lightweight SwiftUI routing package that enables navigation like push, sheet, fullScreenCover, alerts, and custom modals using a simple and consistent API.
This guide focuses on how to use RouterView and the routing system.
 
✅ Setup
Wrap your root view inside RouterView. This provides a router object to manage navigation.
import SwiftUI
import CustomRouting

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
 
🌐 Accessing the Router
To navigate from any view, access the router via @Environment:
@Environment(\.router) private var router
 
📦 Navigation Methods
🔹 Push / Sheet / Full-Screen Navigation
router.showScreen(.push) { _ in
    ProfileView()
}

router.showScreen(.sheet) { _ in
    ProfileView()
}

router.showScreen(.fullScreenCover) { _ in
    ProfileView()
}

router.dismissScreen() // Dismiss current screen
 
🔹 Alerts & Confirmation Dialogs
router.showAlert(.alert, title: "Simple Alert", subtitle: "Message", buttons: nil)

router.showAlert(
    .confirmationDialog,
    title: "Choose Option",
    subtitle: "Select one"
) {
    AnyView(
        Group {
            Button("Option A", action: {})
            Button("Option B", action: {})
        }
    )
}

router.dismissAlert()
 
🔹 Custom Modal
router.showModal(
    backgroundColor: Color.black.opacity(0.3),
    transition: .move(edge: .bottom)
) {
    RoundedRectangle(cornerRadius: 25)
        .fill(Color.blue)
        .frame(height: 300)
        .onTapGesture { router.dismissModal() }
}

router.dismissModal()
 
📌 Example View
struct ProfileView: View {
    @Environment(\.router) private var router

    var body: some View {
        List {
            Button("Push") {
                router.showScreen(.push) { _ in ProfileView() }
            }
            Button("Sheet") {
                router.showScreen(.sheet) { _ in ProfileView() }
            }
            Button("Alert") {
                router.showAlert(.alert, title: "Hey!", subtitle: "This is an alert")
            }
            Button("Show Modal") {
                router.showModal(
                    backgroundColor: .black.opacity(0.5),
                    transition: .move(edge: .bottom)
                ) {
                    Text("Tap to dismiss")
                        .padding()
                        .background(Color.white)
                        .onTapGesture { router.dismissModal() }
                }
            }
        }
        .navigationTitle("RouterView Demo")
    }
}
 
🎯 Summary
Feature	Method
Push screen	router.showScreen(.push) { View() }
Sheet	router.showScreen(.sheet)
FullScreen	router.showScreen(.fullScreenCover)
Dismiss screen	router.dismissScreen()
Alert	router.showAlert(.alert, ...)
Confirmation	router.showAlert(.confirmationDialog, ...)
Dismiss alert	router.dismissAlert()
Custom modal	router.showModal(...)
Dismiss modal	router.dismissModal()
 
📄 License
This project is available under the MIT License.
 
Enjoy using CustomRouting! 🎉
<img width="540" height="710" alt="image" src="https://github.com/user-attachments/assets/35e9b9f2-4b89-4fa8-a1da-635e07f3835e" />
