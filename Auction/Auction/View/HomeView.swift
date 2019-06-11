import SwiftUI

struct HomeView : View {
    var index: Int {
        return Int.random(in: 0..<items.count)
    }
    
    var body: some View {
        NavigationView {
            List {
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
    let width: CGFloat = (UIScreen.main.bounds.width - 48) / 3
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                Image(item.image).resizable().frame(width: self.width, height: self.width)
            }
        }
    }
}

