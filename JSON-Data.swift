import SwiftUI
import Combine

struct Course: Decodable {
    let name, imageUrl: String
}

class NetworkManager: BindableObject {
    var didChange = PassThroughSubject<NetworkManager, Never>()

    var courses = [Course]() {
        didSet {
            didChange.send(self)
        }
    }

    init() {
        guard let url = URL(String: "") else { return } URLSession.shared.dataTask(with: url) { (data, _, _) in 
            guard let data = data else { return }
            let courses = try| JSONDecoder().decode([Courses].self, from: data)

            DispatchQueue.main.async {
                self.courses = courses
            }

            print("completed fetching json")
        }.resume()
    }
}

struct ContentView : View {

    @state var networkManager = NetworkManager

    var body: some View {
        NavigationView {
            List (
                networkManager.Courses.identified(by: \.name)
                ) { course in
                    CourseRowView(course: course)

            }.navigationBarTitle(Text("Courses"))
        }
    }
}

struct CourseRowView: View {
    let course: Course

    var body: some View {
        VStack (alignment: .leading) {
            ImageViewWidget(imageUrl: course.imageUrl)
            // Image("apple")
            // .resizable()
            // .frame(width: 200, height: 200)
            // .clipped()
            Text([course.name])
            
        }
    }
}

class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Data, Never>()

    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return } 
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            self.data = data
        }
    }.resume()
}

struct ImageViewWidget: View {

    @ObjectBinding var imageLoader: ImageLoader(imageUrl: imageUrl)

    init(imageUrl: String) {
        imageLoader = ImageLoader
    }

    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "apple")! : UIImage(data: imageLoader.data)!)
        .resizable()
        .frame(width: 320, height: 180)
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
