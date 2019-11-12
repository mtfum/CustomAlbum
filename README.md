# 🖼 CustomAlbum

CustomAlbum automatically saves Image or Movie to app-specific album in Photos.

## Demo GIF

<img alt="Custom Album Demo GIF" src="https://github.com/mtfum/CustomAlbum/blob/master/Demo.gif" width="80%">

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

    The MIT License (MIT)

  Copyright (c) 2019 mtfum

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
