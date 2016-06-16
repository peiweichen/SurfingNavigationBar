# SurfingNavigationBar
Easy way to manage UINavigationBar , implemented in swift
# What is it 
This project is heavily inspired by [LTNavigationBar](https://github.com/ltebean/LTNavigationBar). SurfingNavigationBar provides you a chance to use pure Swift alternative in your next app.

![alt tag](http://peiweichen.github.io/outofwebsite/gif/SurfingNavigationBar/bgcolor_nav.gif)
![alt tag](http://peiweichen.github.io/outofwebsite/gif/SurfingNavigationBar/alpha_nav.gif)
![alt tag](http://peiweichen.github.io/outofwebsite/gif/SurfingNavigationBar/translationY_nav.gif)
![alt tag](http://peiweichen.github.io/outofwebsite/gif/SurfingNavigationBar/all_nav.gif)


# Usage

### Warning:Check out demo app directly if you're too lazy to read 
Firstly drag SurfingNavigationBar.swift into your project.
The UINavigationBar Extension includes 4 methods to manage UINavigationBar's appearance


```swift
func surfing_setBackgroundColor(backgroundColor:UIColor)
func surfing_setElementsAlpha(alpha:CGFloat)
func surfing_setTranslationY(translationY:CGFloat)
func surfing_reset()
```

Usually you should implement below function to avoid any side effects:

```swift
override func viewWillDisappear(animated: Bool) {
   super.viewWillDisappear(animated)
   self.navigationController?.navigationBar.surfing_reset()
}
```

# Mechanism:

SurfingNavigationBar implement `self.setBackgroundImage(UIImage(), forBarMetrics: .Default)` which remove the original appearance of UINavigationBar and we add a `overlayView:UIView` on UINavigationBar in runtime.The color,alpha,transfromY of overlayView is the variables we're managing.

Author
------
Peiwei Chen 
peiwei233@gmail.com  
[Blog](http://peiweichen.github.io)  


License
-------
Copyright (c) 2016 Peiwei Chen <peiwei233@gmail.com>. See the LICENSE file for license rights and limitations (MIT).


