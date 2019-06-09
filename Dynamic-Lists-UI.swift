import SwiftUI

struct User: Identifiable {
    var id: Int
    let username, message, imageName: String
}

struct ContentView : View {

    let users: [User] = [
        .init(id: 0, username: "Tim Cook", message: "What do you think of about the pricing on the pro stand?", imageName: "tim_cook")
        .init(id: 1, username: "Craig Federighi", message: "What do you think of about the pricing on the pro stand?", imageName: "craig_f")
        .init(id: 2, username: "Jon Ivey", message: "What do you think of about the pricing on the pro stand?", imageName: "jon_ivey")
    ]
    var body: some View {
        NavigationView {
            List {
                //Text("Headline Here").font(.largeTitle) #can set a headline above each section in the list
                ForEach(users.identified(by: \.id)) { user in
                    //user row
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }   
}

struct UserRow: View {

    let user: User

    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
                //You'll get a black box if the image file isn't found
            
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil) //lineLimit displays all text
            }.padding(.leading: 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif