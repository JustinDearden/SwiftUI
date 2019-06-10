import SwiftUI

struct Post {
    let id: Int 
    let username, text, imageName: String
}

struct ContentView : View {
    //Holding the posts that will be displayed
    let posts = [Post] = [
        .init(id: 0, username: "John", text: "What is your favorite food?", imageName: "Image-Name-HERE")
        .init(id: 1, username: "John", text: "What is your favorite food?", imageName: "Image-Name-HERE")
    ]
    
    var body: some View {
        NavigationView {
            List {

                VStack (alignment: .leading) {
                    Text("Trending")
                    ScrollView {
                        VStack (alignment: .leading) {
                            HStack {
                                //use a ForEach on a groups array
                                NavigationButton(destination: GroupDetailView()) {
                                    GroupView()
                                }

                            }
                        }   

                    }.frame(height: 200)
                
                }

                //Post rows
                ForEach(posts.identified(by: \.id)) { post in
                    PostView(post: post)
                    
                }

            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("Group Detail View")
    }
}

struct GroupView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image("Image-Name")
            .renderingMode(.original) //removes the blue tint on the button
            .cornerRadius(8)
            Text("Hiking in Colorado")
            .color(.primary)
            .lineLimit(nil)
            .padding(.leading, 0)
        }.frame(width: 110, height: 170)
    }
}

struct PostView: View {

    let post: Post

    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image("Image-Name")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
                Vstack (alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16)
            
            Text("Body Text")
            .lineLimit(nil)
            .padding(.leading, 16)
            .padding(.trailing, 32)
            //Ensure the asset size is large enough for the screen
            Image(post.imageName)
            .scaledToFill()
            .frame(height: 350)
            .clipped()
        }.padding(.leading, -20).padding(.bottom, -8).padding(.trailing, -20)
        //.bottom moves the content over the seperation lines for posts (removes them - avoid this in production)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
