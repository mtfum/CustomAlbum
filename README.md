# 🖼 CustomAlbum

CustomAlbum automatically saves Image or Movie to app-specific album in Photos.

## Demo GIF

<div align="center"><img alt="Custom Album Demo GIF" src="https://github.com/mtfum/CustomAlbum/blob/master/Demo.gif" width="40%"></div>

 ## Install

### Swift Package Manager

Select Xcode menu File > Swift Packages > Add Package Dependency... and enter repository URL with GUI.

```
  Repository: https://github.com/mtfum/CustomAlbum
```

### Cocoapods

Add the following to your Podfile

```
  pod 'CustomAlbum'
```

### Carthage

Add the following to your Cartfile

```
  github "mtfum/CustomAlbum"
```

## Usage

Before using, you need to allow  `NSPhotoLibraryUsageDescription` in info.plist



```swift
  CustomAlbum.shared.save(image) { result in
    switch result {
    case .success(let asset):
      // do something
    case .failure(let error):
      // do something
    }
  }
```


## Tests

There are no tests yet. 
I'm waiting for your PR!

## Information and Contact

Developed by [@mtfum](https://github.com/mtfum).

Contact me by Twitter [@mtfum](https://twitter.com/mtfum)

## License

CustomAlbum is licensed under the MIT License. See the [LICENSE](https://github.com/mtfum/CustomAlbum/LICENSE) file for more information.
