import SwiftUI

struct ContentView: View {
    @State private var selectedItem: AppListItem? = nil
    @State private var query = ""

    var filtered: [AppListItem] {
        query.isEmpty
            ? AppConfig.listItems
            : AppConfig.listItems.filter { $0.title.contains(query) }
    }

    var body: some View {
        NavigationSplitView {
            List(filtered, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(item.color.opacity(0.15))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(item.icon)
                                    .font(.title3)
                            )
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.title)
                                .font(.system(.body, design: AppConfig.fontDesign).weight(.semibold))
                            Text("اضغط للتفاصيل")
                                .font(.system(.caption, design: AppConfig.fontDesign))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 2)
                }
            }
            .searchable(text: $query, prompt: "بحث...")
            .navigationTitle("مهامي")
            .background(AppConfig.backgroundColor.ignoresSafeArea())
        } detail: {
            if let item = selectedItem {
                ItemDetailView(item: item)
            } else {
                ContentUnavailableView(
                    "اختر عنصراً",
                    systemImage: "sidebar.left",
                    description: Text("اختر من القائمة للعرض")
                )
                .foregroundStyle(AppConfig.primaryColor)
            }
        }
        .tint(AppConfig.primaryColor)
    }
}

struct ItemDetailView: View {
    let item: AppListItem

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [item.color, AppConfig.primaryColor],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .overlay(Text(item.icon).font(.system(size: 44)))

                Text(item.title)
                    .font(.system(.title, design: AppConfig.fontDesign).bold())
                    .foregroundStyle(item.color)

                Text("تفاصيل العنصر المحدد تظهر هنا. يمكنك تعديل هذه الشاشة لعرض أي محتوى تريده.")
                    .font(.system(.body, design: AppConfig.fontDesign))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button("إجراء ما") {}
                    .buttonStyle(.borderedProminent)
                    .tint(item.color)
            }
            .padding(.top, 40)
        }
        .navigationTitle(item.title)
        .background(AppConfig.backgroundColor.ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
