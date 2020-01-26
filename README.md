# JeffResume
This is an app version of my resume with demos of many skillsets I learned.

## Architect Overview
![](https://i.imgur.com/YvB0Umfl.png)

## Content
- [Base Sliding Controller](#base-sliding-controller)
- [Menu Controller](#menu-controller)
- [Self Bio Controller](#self-bio-controller)
- [Nested Table View Demo Controller](#nested-table-view-demo-controller)
- [Animation Demo Controller](#animation-demo-controller)
- [login-demo-controller](#login-demo-controller)


## Base Sliding Controller
This controller is responsibility for displaying of all views corrspond to the slide menu. It will receive index from MenuController

### Show Slide Menu
You can show menu by swip your finger from the left edge of the screen to the right or tap on the button on the upper left corner. The swiping gesture shows menu by calling ```handlePan(gesture: UIPanGestureRecognizer)```. As for the button we uses ```NotificationCenter.default.post(name: .showSlideMenu, object: nil)``` to tell ```BaseSidingController``` to show menu.

### Hide Slide Menu
You can hide menu by swiping your finger right to left or tap outside of the menu. The swiping gesture is handle by ```handlePan(gesture: UIPanGestureRecognizer)```, and tap gesture is handle by ```handleTapDismiss()```.

### Change slide menu
The slide menu which is ```MenuController``` and can be swap with any ```UIVewController```. We will also need to add a delegate as ```BaseSlidingControllerDelegate``` in order to tell ```BaseSlidingController``` which view to show. 


## Menu Controller
This controller is responsible for display menu and tell ```BaseSlidingController``` which view to show by index.

### Change Datasource of Menu Controller
You can update the datasource inside ```viewModel: MenuViewModel```. It is an array of String as ```menuItems: [String]```. Keep in mind row count must match the index of ```didSelectMenuItem(index: Int)``` in ```BaseSlidingController```. 

## Self Bio Controller
Coming soon

## Nested Table View Demo Controller
This controller demostrate how to construct TableView with nested CollectionView. Data is from rss itune and this the base url https://rss.itunes.apple.com/api/v1/.
### UI Layout
![](https://i.imgur.com/JmZiFE2l.png)

### UI Layout constructure
NestedViewTabController contains 
This controller uses base URL from https://rss.itunes.apple.com/api/v1/, then use ```ItuneURLWrapper``` to construct the remaining URI string. 

## Animation Demo Controller
Coming soon

## Login Demo Controller
coming soon
