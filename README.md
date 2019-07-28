### Purpose 
These are examples of layouts using SwiftUI. 
- More uploads coming. 

### Dynamic List
An example of a list element that can be populated with an image, title and text. Similar to a contacts styled layout. 

### News Feed
A Facebook style news feed that contains a top bar 'Featured' posts, followed by a styled list.
- Uses static data but can be altered to read in data from a Json file.

### Json Data
A standard view that can read in Json data as bindable objects / display the information. 
- Contains two bindable objects, one for text the other for images

### State Management / Binding
An example on binding data / variables inside an application.
- Data is entered by the user and stored inside a list. The data is also bound to textfields that update while text is entered.

### Calculator-UI
- An example of a calculator app UI.

### Basic Profile
A base template for a profile page
- Future updates to make it look like Instagram profile page

### Countdown
- A countdown (time) app interface. The digital clock face will countdown based on a user set time till completion

### AlertView
- An example of how to use the alert view functionality

### Badge View
- Creates a simple badge that can be altered with text/color/images. Can be added to a list view. 

### Stepper
- Create a stepper element using SwiftUI

### SFSymbols
- A playground that lists all the SYSymbols in SwiftUI. Incorproates screen transitions upon clicking a symbol

### SplitView
- A SwiftUI view that incorporates a UISplitViewController

### SlideMenu
- SwiftUI example of a slide in side menu. Options present to change the colour of the menu, along with controls to dismiss it

### Card Animation
Animate cards with SwiftUI
#### 3D

For add 3D rotation for back cards use code:

`.rotation3DEffect(
	Angle(degrees: dragState.isActive ? 0 : 60), axis: (x: 10.0, y: 10.0, z: 10.0)
 )`
For medium card use 30 angles.

#### Animation

In preview I am use Spring animation for all cards:

`.animation(.spring())`

### Horizontal Card Slider

Layout for a single card is created
- Image and text can be edited or affects added
- Programatically create duplicates inside a scrollView
