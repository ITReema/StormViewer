# StormViewer
app to display a list of images
## Implementation
The app has two view controller scenes:
* **ViewController** contain UITableViewController list of image name 
* **DetailViewController** to showing selected image
<p align="center">
  <img width="250" height="500" src="https://user-images.githubusercontent.com/27751735/55982941-9c678c80-5ca2-11e9-891b-193a4db79211.png">
</p>
<p align="center">
  <img width="250" height="500" src="https://user-images.githubusercontent.com/27751735/55982942-9d002300-5ca2-11e9-9152-ad2fa2b35e02.png">
</p>

## Challenge
* Use Interface Builder to select the text label inside your table view cell and adjust its font size to something larger – experiment and see what looks good.

* In your main table view, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”.

* Rather than show image names in the detail title bar, show “Picture X of Y”, where Y is the total number of images and X is the selected picture’s position in the array. Make sure you count from 1 rather than 0.
