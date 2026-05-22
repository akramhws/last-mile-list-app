import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String
    let color: String
}

extension Item {
    static let samples: [Item] = [
        Item(title: "التصميم", subtitle: "واجهة المستخدم والتجربة", systemImage: "paintbrush.fill", color: "blue"),
        Item(title: "التطوير", subtitle: "كود نظيف وقابل للصيانة", systemImage: "chevron.left.forwardslash.chevron.right", color: "green"),
        Item(title: "الاختبار", subtitle: "جودة عالية وأداء ممتاز", systemImage: "checkmark.seal.fill", color: "orange"),
        Item(title: "النشر", subtitle: "وصول سريع للمستخدمين", systemImage: "airplane", color: "purple"),
        Item(title: "التحليل", subtitle: "بيانات ورؤى قابلة للتنفيذ", systemImage: "chart.bar.fill", color: "red"),
        Item(title: "الدعم", subtitle: "مساعدة متواصلة على مدار الساعة", systemImage: "headphones", color: "teal"),
    ]
}
