import SwiftUI

struct ContentView: View {
    @State private var selectedItem: Item?
    @State private var searchText = ""

    var filtered: [Item] {
        searchText.isEmpty ? Item.samples : Item.samples.filter { $0.title.contains(searchText) }
    }

    var body: some View {
        NavigationSplitView {
            List(filtered, selection: $selectedItem) { item in
                ItemRow(item: item)
                    .tag(item)
            }
            .searchable(text: $searchText)
            .navigationTitle("القائمة")
        } detail: {
            if let item = selectedItem {
                ItemDetailView(item: item)
            } else {
                ContentUnavailableView("اختر عنصراً", systemImage: "list.bullet")
            }
        }
    }
}

struct ItemRow: View {
    let item: Item
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.systemImage)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(Color(item.color))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title).font(.headline)
                Text(item.subtitle).font(.caption).foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct ItemDetailView: View {
    let item: Item
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: item.systemImage)
                .font(.system(size: 80))
                .foregroundStyle(.white)
                .frame(width: 140, height: 140)
                .background(Color(item.color))
                .clipShape(RoundedRectangle(cornerRadius: 32))
            Text(item.title).font(.largeTitle.bold())
            Text(item.subtitle).font(.title3).foregroundStyle(.secondary).multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview { ContentView() }
