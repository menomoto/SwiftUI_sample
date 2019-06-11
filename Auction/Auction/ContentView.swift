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
    var body: some View {
        NavigationView {
            List {
                Text("Home")
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct ListView : View {
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationButton(destination: DetailView()) {
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
    var body: some View {
        Text("Detail")
    }
}

let items: [Item] = [
    Item(id: 1, image: "01", title: "Item01", price: 12000),
    Item(id: 2, image: "02", title: "Item02", price: 16000),
    Item(id: 3, image: "03", title: "Item03", price: 35000),
    Item(id: 4, image: "04", title: "Item04", price: 29800),
    Item(id: 5, image: "05", title: "Item05", price: 79800),
    Item(id: 6, image: "06", title: "Item06", price: 128000),
]

struct Item : Hashable, Codable, Identifiable {
    var id: Int
    let image: String
    let title: String
    let price: Int
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
