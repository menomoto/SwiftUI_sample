import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Text("Hello World")
            Text("Hello World2")
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
