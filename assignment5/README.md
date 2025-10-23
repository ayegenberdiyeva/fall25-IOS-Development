## RandomizerApp (Assignment 5)

A UIKit app that displays a random favorite item (image + title) from a prepared dataset. Built with Storyboard, Auto Layout, and simple MVC-style organization.

### Features
- Randomize button picks a new item
- Shows item image and title
- Uses assets stored in `Assets.xcassets`
- Layout adapts to multiple iPhone sizes via Auto Layout

### Project Structure
- `assignment5_randomizerapp/assignment5_randomizerapp/`
  - `Controllers/` – View controllers (e.g., `ViewController.swift`)
  - `Models/` – Data models and enums
  - `MockData/` – Sample data for items
  - `Views/` – Storyboards and view-specific files
  - `Assets.xcassets/` – Images
  - `AppDelegate.swift`, `SceneDelegate.swift`, `Info.plist`

### How to Run
1. Open `assignment5_randomizerapp/assignment5_randomizerapp.xcodeproj` in Xcode.
2. Select an iPhone simulator (e.g., iPhone SE or iPhone 15 Pro Max).
3. Build and run.

### UI & Auto Layout
- One `UIImageView` centered with a maintained aspect ratio
- One `UILabel` for item title with proper content hugging
- One `UIButton` to randomize items
- Uses safe area constraints and consistent spacing

### Data
- At least 10 items, each with an image and a readable title
- Images added to `Assets.xcassets` with clear names

### Bonus (Optional)
- Additional details per item (description, attributes) updated on randomize

### Notes
- Tested across multiple device sizes to verify constraints
- See `iOS Development Assignment#5—Random.md` for the full assignment brief


