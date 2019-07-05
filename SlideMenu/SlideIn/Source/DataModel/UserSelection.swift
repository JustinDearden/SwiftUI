import Combine
import SwiftUI

final class UserSelection: BindableObject {
    let didChange = PassthroughSubject<UserSelection, Never>()
    
    var selectedColor: Color = .sunflower {
        didSet {
            didChange.send(self)
        }
    }
    
    var showSideMenu: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var colors = colorsData {
        didSet {
            didChange.send(self)
        }
    }
}
