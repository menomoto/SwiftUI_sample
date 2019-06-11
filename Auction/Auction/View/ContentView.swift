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

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
