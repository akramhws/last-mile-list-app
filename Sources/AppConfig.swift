import SwiftUI

// Default values — overwritten by Last Mile runner at build time

struct AppListItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
}

enum AppConfig {
    static let primaryColor:    Color   = Color(hex: "#3B82F6")
    static let accentColor:     Color   = Color(hex: "#F59E0B")
    static let backgroundColor: Color   = Color(hex: "#FFFFFF")
    static let fontDesign: Font.Design  = .rounded
    static let preferredColorScheme: ColorScheme? = .light
    static let appDisplayName           = "My App"

    // Hello World
    static let heroEmoji    = "⭐"
    static let heroLabel    = "مرحباً!"
    static let buttonLabel  = "اضغط هنا"

    // Tab App
    static let tab1Label    = "الرئيسية"
    static let tab2Label    = "استكشاف"
    static let tab3Label    = "حسابي"

    // List App
    static let listItems: [AppListItem] = [
        AppListItem(title: "تصميم",  icon: "🎨", color: Color(hex: "#3B82F6")),
        AppListItem(title: "تطوير",  icon: "💻", color: Color(hex: "#10B981")),
        AppListItem(title: "اختبار", icon: "✅", color: Color(hex: "#F97316")),
        AppListItem(title: "نشر",    icon: "🚀", color: Color(hex: "#8B5CF6")),
    ]
}
