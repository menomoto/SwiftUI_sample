import SwiftUI

struct HomeView : View {
    var index: Int {
        return Int.random(in: 0..<items.count)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: true, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
                ForEach(items) { item in
                    HomeRow(items: [items[self.index], items[self.index], items[self.index]])
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
