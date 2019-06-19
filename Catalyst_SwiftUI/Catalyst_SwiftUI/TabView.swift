import SwiftUI
import Combine

struct TabView : View {
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

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
#endif

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
    var width: CGFloat {
        #if targetEnvironment(UIKitForMac)
            return 300
        #else
            return (UIScreen.main.bounds.width - 24) / 3
        #endif
    }
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                NavigationButton(destination: DetailView(item: item)) {
                    ImageView(item: item)
                    .frame(width: self.width, height: self.width)
                }
            }
        }
    }
}

struct ImageView : View {
    var item: Item
    var body: some View {
        Image(item.image)
            .resizable()
            .renderingMode(.original) // 無いとImageが正常に表示されない
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
    var imageWidth: CGFloat {
        #if targetEnvironment(UIKitForMac)
        return 900
        #else
        return UIScreen.main.bounds.width
        #endif
    }
    var item: Item
    
    var body: some View {
        ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: false, alwaysBounceVertical: true, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
            VStack(alignment: .leading) {
                Image(item.image).resizable().frame(width: imageWidth, height: imageWidth)
                Text(item.title).bold().font(.title).padding(16)
                Text("¥\(item.price)").font(.title).padding(16)
                
                DetailGridView().frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
            }
        }
        .navigationBarTitle(Text(item.title))
        
    }
}

struct DetailGridView : View {
    var body: some View {
        ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: true, alwaysBounceVertical: false, showsHorizontalIndicator: false, showsVerticalIndicator: false) {
            HStack {
                ForEach(items) { item in
                    NavigationButton(destination: DetailView(item: item)) {
                        Image(item.image).resizable().renderingMode(.original).frame(width: 80, height: 80)
                    }
                }
            }
        }
    }
}
