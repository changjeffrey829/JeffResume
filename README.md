# JeffResume
This is an app version of my resume with demos of many skillsets I learned.
[![changjeffrey829](https://circleci.com/gh/changjeffrey829/JeffResume.svg?style=svg)](https://circleci.com/gh/changjeffrey829/JeffResume)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

## UI Layout Overview
![](https://i.imgur.com/5SrTUGal.png)

## Supporting Version
This app requires minimum version of iOS 13.

## Cocoapod Dependencies
- [SwiftLint](https://github.com/realm/SwiftLint)

## Content
- [Base Sliding Controller](#base-sliding-controller)
- [Menu Controller](#menu-controller)
- [Self Bio Controller](#self-bio-controller)
- [Nested Table View Demo Controller](#nested-table-view-demo-controller)
- [Animation Demo Controller](#animation-demo-controller)
- [Login Demo Controller](#login-demo-controller)
- [License](#license)

## Base Sliding Controller
This controller is responsibility for displaying of all views correspond to the slide menu. It will receive index from MenuController

### Show Slide Menu
You can show menu by swip your finger from the left edge of the screen to the right or tap on the button on the upper left corner. The swiping gesture shows menu by calling ```handlePan(gesture: UIPanGestureRecognizer)```. As for the button it uses ```NotificationCenter.default.post(name: .showSlideMenu, object: nil)``` to notify ```BaseSidingController```.

### Hide Slide Menu
You can hide menu by swiping your finger right to left or tap outside of the menu. The swiping gesture is handle by ```handlePan(gesture: UIPanGestureRecognizer)```, and tap gesture is handle by ```handleTapDismiss()```.

### Change Slide Menu
The slide menu which is ```MenuController``` and can be swap with any ```UIVewController```. We will also need to add a delegate as ```BaseSlidingControllerDelegate``` in order to tell ```BaseSlidingController``` which view to show. 

## Menu Controller
This controller is responsible for display menu and tell ```BaseSlidingController``` which view to show by index.

### Screenshot
![](https://i.imgur.com/XmpVaCZl.png)

### Change Datasource of Menu Controller
You can update the datasource inside ```viewModel: MenuViewModel```. It is an array of String as ```menuItems: [String]```. Keep in mind row count must match the index of ```didSelectMenuItem(index: Int)``` in ```BaseSlidingController```. 

## Self Bio Controller
Coming soon

## Nested Table View Demo Controller
This controller can show top movies, podcasts, and audiobooks from Itune. Users can customize output by tapping the filter button on ```NestedTableViewCell```.

### Screenshot
![](https://i.imgur.com/5tf5fwIl.png)

### UI Wireframe
![](https://i.imgur.com/JmZiFE2l.png)

### Network Request
Data is from RSS Itune and this the base url https://rss.itunes.apple.com/api/v1/. ```NestedTableCellViewModel: NSObject``` will call ```loadMedia(urlString: String, completion: @escaping (Result<[MediaObject], MediaLoadingError>) -> Void)``` to get a list of media. ```CollectionMediaCellViewModel``` will call ```getImagefromURL(completion: @escaping (Result<UIImage, MediaLoadingError>) -> Void)``` in order to get cached image or make a network request to get it from server.

#### Example code for network call to get a list of top movies from Itune.
```
        let mediaComponent = ItuneURLMovieComponent(feedTypeOption: .topMovies, genre: .all)
        guard let urlString = URLStringCreator.createItuneURLString(ituneMediaComponent: mediaComponent, country:     .unitedStates, resultLimit: 10, allowExplicit: true) else {return}
        let networkService = NetworkService()
        networkService.loadMedia(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                print("error occured: \(error.localizedDescription)")
            case .success(let mediaObjects):
                print("an array of mediaObjects we got from server: \(mediaObjects)")
            }
        }
```

## Animation Demo Controller
Coming soon

## Login Demo Controller
coming soon

## LICENSE
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
