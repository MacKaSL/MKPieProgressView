# MKPieProgressView

### A simple custom pie chart/circular progress.

<img src="https://github.com/MacKaSL/MKPieProgressView/blob/master/MKPieProgressView%201.png" height="700">

## Installing


## Usage

Create an `@IBOutlet weak var mkView: MKPieProgressView!` and hook it up with the view you have created in the storyboard.


### Below are directly configurable from the storyboard.

`@IBInspectable var lineWidth: CGFloat` 
Controlls the line width. Default value is set to 15.

`@IBInspectable var progress: CGFloat`
Sets the stroke end value. Make sure to set the value in percentage. Ex: `55/100.0`

`@IBInspectable var pathColor: UIColor`
You can set the path color with this. Default `R:206 G:205 B:207`

`@IBInspectable var progressColor: UIColor`
Sets progress color. Default `R:255 G:68 B:99`


### Below are configurable from the code.

`var lineCap: CAShapeLayerLineCap`
Sets the line cap. Default is set to `round`

`var animationDuration: Double`
Sets progress path animation duration. Default is set to 1


### Sample code

```
override func viewDidLoad() {
    super.viewDidLoad()
    mkView.lineCap = .square
    mkView.animationDuration = 0.8
}
```
