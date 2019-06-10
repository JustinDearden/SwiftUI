import SwiftUI

struct ContentView : View {
    //Bindable objects
    @state var firstName = ""
    @state var lastName = ""
    @state var users = [String]() //Empty string array

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        group {
                            TextField($firstName , placeholder: Text("First Name")).padding(12)
                        }.background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)

                        group {
                            TextField($lastName , placeholder: Text("Last Name")).padding(12)
                        }.background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)

                    Button(action: {

                        self.users.append("\(self.firstName) \(self.lastName)")
                        self.firstName = ""
                        self.lastName = ""

                    }) {
                        group {
                            Text("Create User").color(.white).padding(12)
                        }.background((firstName.count + lastName.count > 0) ? Color.blue : Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)
                    }
                    }.padding(12)
                }.background(Color.gray)

                List (users.identified(by: \.self)) {
                    Text($0)
                }
            }.navigationBarTitle(Text("Credit Card Form"))
            .navigationBarItems(leading: HStack {
                Text("First Name:")
                Text(firstName).color(.red)
                Text("Last Name:")
                Text(lastName).color(.red)
            })
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
