# MKPieProgressView

### A simple custom pie chart/circular progress.


## Usage


## Configuring View
### Below are directly configurable from your storyboard.

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
