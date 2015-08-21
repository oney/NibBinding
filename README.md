# NibBinding

[![CI Status](http://img.shields.io/travis/Howard Yang/NibBinding.svg?style=flat)](https://travis-ci.org/Howard Yang/NibBinding)
[![Version](https://img.shields.io/cocoapods/v/NibBinding.svg?style=flat)](http://cocoapods.org/pods/NibBinding)
[![License](https://img.shields.io/cocoapods/l/NibBinding.svg?style=flat)](http://cocoapods.org/pods/NibBinding)
[![Platform](https://img.shields.io/cocoapods/p/NibBinding.svg?style=flat)](http://cocoapods.org/pods/NibBinding)

## Installation

NibBinding is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NibBinding"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Why?

I love to use Interface Builder to build UI, and I really hate to build UI programmatically. However, sometime I still have to write some codes.

For example, an image is added after users tap the button.

```swift
var photo = UIImageView(image: UIImage(named: "san-francisco-golden.jpg"))
view.addSubview(photo)
photo.setTranslatesAutoresizingMaskIntoConstraints(false)

view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[photo]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["photo": photo]))
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-130-[photo(200)]", options: .DirectionLeadingToTrailing, metrics: nil, views: ["photo": photo]))
```

Now if you use NibBinding, you can do it like that.

Create a Nib named "PhotoTemplate.xib", and edit like the following. After setting UI, mark views tag as 100 and 101.
![PhotoTemplate.xib](http://i.imgur.com/N2htZxc.jpg)

And then, bind them together.
```swift
import NibBinding

var photo = UIImageView(image: UIImage(named: "san-francisco-golden.jpg"))
NibBinding.bind("PhotoTemplate", views: [100: view, 101: photo])
```
Done.

## Author

Howard Yang, appdevoney@gmail.com

## License

NibBinding is available under the MIT license. See the LICENSE file for more info.
