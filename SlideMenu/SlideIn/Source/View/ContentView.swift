import SwiftUI

struct ContentView : View {
    private var userSelection = UserSelection()
    
    var body: some View {
        ZStack {
            HStack {
                SideMenuView().environmentObject(userSelection)
            }
            HomeView().environmentObject(userSelection)
        }
    }
}

struct BlankView : View {
    var body: some View {
        Color.white
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
