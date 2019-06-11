import SwiftUI

struct DetailView : View {
    let imageWidth: CGFloat = UIScreen.main.bounds.width
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
