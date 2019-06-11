import SwiftUI
import Combine

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        TabbedView(selection: $selection){
            HomeView()
                .font(.title)
                .tabItemLabel(Image("home"))
                .tag(0)
            ListView()
                .font(.title)
                .tabItemLabel(Image("list"))
                .tag(1)
        }
    }
}

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

struct ListView : View {
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationButton(destination: DetailView(item: item)) {
                        ItemRow(item: item)
                    }
                }
            }
            .navigationBarTitle(Text("List"))
        }
    }
}

struct ItemRow : View {
    var item: Item

    var body: some View {
        HStack {
            Image(item.image).resizable().frame(width: 80, height: 80)
            VStack() {
                Text(item.title).bold().font(.title)
                Text("¥\(item.price)").font(.subheadline)
            }
        }
    }
}

struct DetailView : View {
    let imageWidth: CGFloat = UIScreen.main.bounds.width
    var item: Item

    var body: some View {
//        ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: true, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
            
            VStack(alignment: .leading) {
                Image(item.image).resizable().frame(width: imageWidth, height: imageWidth)
                Text(item.title).bold().font(.title).padding(16)
                Text("¥\(item.price)").font(.title).padding(16)

                DetailGridView()
            }
//        }
    }
}

struct DetailGridView : View {
    var body: some View {
        ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: true, alwaysBounceVertical: false, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
            HStack {
                ForEach(items) { item in
                    Image(item.image).resizable().frame(width: 80, height: 80)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
