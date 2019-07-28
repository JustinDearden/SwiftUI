import SwiftUI

struct HomeList : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
        }
    }
}

#if DEBUG
struct HomeList_Previews : PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
#endif

struct CourseView : View {
    var body: some View {
        return VStack(alignment: .leading) {
            Text("Build An App With SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .color(.white)
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
                Spacer()
                Image("Illustration1")
            }
            .background(Color("background3"))
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: Color("backgroundShadow3"), radius: 20, x: 0, y: 20)
    }
}
