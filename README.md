# JeffResume
This is an app version of my resume with demos of many skillsets I learned.

# Architect Overview

## Base Sliding Controller
This controller is responsibility for displaying of all views corrspond to the slide menu.

### Public method
#### openMenu()
This method updates isMenuOpened to true then show side menu by sliding it to the right with animations.
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

## Menu Tab(MenuController)
This controller is responsible for display and style of side menu. It will call didSelectMenuItem(index: Int)
tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

### Public method
#### N/A

## 
