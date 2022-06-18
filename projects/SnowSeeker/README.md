# SnowSeeker

<img src="Documentation/demo.gif" alt="Demo" width="320"/>

## iPad
<img src="Documentation/demo-ipad.gif" alt="Demo iPad"/>

## Requirements
* Xcode 13.2   
* iOS 15.2

## Highlight
* Using splitted view to making optimization of iPad.
* Using `horizontalSizeClass` and `dynamicTypeSize` to optimize layout between the large device and small device.
* Using `objectWillChange.send()` to implement manually `ObservableObject` published (because `@Published` can't sent change when item is modified)
