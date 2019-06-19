import SwiftUI

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

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
#endif
