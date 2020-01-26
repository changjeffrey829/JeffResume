# JeffResume
This is an app version of my resume with demos of many skillsets I learned.

//test
- [Menu Controller](#menucontroller)

## Architect Overview
![](https://i.imgur.com/YvB0Umfl.png)


## Base Sliding Controller
This controller is responsibility for displaying of all views corrspond to the slide menu. It will receive index from MenuController

### Change slide menu
We can slide menu to any ```UIViewController``` by change the ```leftViewController``` of ```BaseSlidingController```. We can do that by changing init value of ```BaseSlidingController``` in ```SceneDelegate```. That view controller is responsible for telling ```BaseSlidingController``` which view to show. you can 
### Public method
#### openMenu()
This method updates isMenuOpened to true then show side menu by sliding it to the right with animations. 
##### example code
```
let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController
vc?.openMenu()
```

#### didSelectMenuItem(index: Int)
This method will remove the current centerViewController and pick a new one via switch statement from index.
```
let slidingController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController
slidingController?.didSelectMenuItem(index: indexPath.row)
```

## MenuController
This controller is responsible for display and style of side menu. It will call ```.didSelectMenuItem(index: Int)
tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)```. This controller can be replaced with a different style side menu. Check "Base Slide Controller" under "Change side menu" for instruction on how to implement change.

### Datasource
It's inside ``` viewModel: MenuViewModel ``` as ``` menuItems: [String] ```.

## NestedViewTabController
This controller demostrate how to construct TableView with nested CollectionView. Data is from rss itune and this the base url ```https://rss.itunes.apple.com/api/v1/```.
### UI Layout
![](https://i.imgur.com/JmZiFE2l.png)

### UI Layout constructure
NestedViewTabController contains 
This controller uses base URL from https://rss.itunes.apple.com/en-us, then use ```ItuneURLWrapper``` to construct the remaining URI string. 
