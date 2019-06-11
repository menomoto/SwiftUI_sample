import SwiftUI

struct HomeView : View {
    var body: some View {
        NavigationView {
            ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: true, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
                ForEach(0..<items.count) { index in
                    if (index + 1) % 3 == 0 || index + 1 == items.count {
                        HomeRow(items: [items[index - 2], items[index - 1], items[index]])
                    }
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct HomeRow : View {
    var items: [Item]
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                NavigationButton(destination: DetailView(item: item)) {
                ImageView(item: item)
                }
            }
        }
    }
}

struct ImageView : View {
    var item: Item
    let width: CGFloat = (UIScreen.main.bounds.width - 24) / 3
    
    var body: some View {
        Image(item.image)
            .resizable()
            .renderingMode(.original) // 無いとImageが正常に表示されない
            .frame(width: self.width, height: self.width)

    }
}
