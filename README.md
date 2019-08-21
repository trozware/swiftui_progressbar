# Custom built progress bar in SwiftUI

## Usage:

ProgressBar.swift is the file you need to include in your project.  
Include `ProgressBar()` in your own view with 3 bound values:

- maxValue
- currentValue
- barWidth

The bar will then draw a rounded rectangle with an internal rectangle showing the percentage progress.
The width of the ProgressBar view will be as specified in `barWidth`.

Change the colors and bar height to suit your styling.

---

ContentView.swift contains an example of how to use it with a slider and quick action buttons to adjust the progress for testing.

ContentView.swift also contains an example of using a ViewModifer struct to apply a set of modifiers to a View.

---

## Change Log:

- 22nd August 2019: reset repository due to gitignore issues leaving out vital files.
- 21st August 2019: changed project name to avoid namespace conflicts in Xcode 11, beta 6.
