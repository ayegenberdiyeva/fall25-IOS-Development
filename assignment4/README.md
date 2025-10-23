# DiceeApp

A simple UIKit-based iOS app that simulates rolling two dice. Demonstrates UIImageView, UIButton, IBOutlet/IBAction connections, and basic UI updates. Includes optional "shake to roll" support for physical devices.

## Features
- Tap "Roll" button to randomize two dice images.
- Optional: shake device to roll.
- Uses image assets `dice1` … `dice6`.

## Requirements
- Xcode 13+ (or compatible)
- Swift, Storyboard interface
- Assets added to Assets.xcassets: `dice1`..`dice6`

## Project setup
1. Create a new project named `DiceeApp` (Storyboard, Swift).
2. Add two UIImageView components and one UIButton (title: "Roll") to the main storyboard.
3. Connect outlets and action in `ViewController`:
   - @IBOutlet weak var lhsDice: UIImageView!
   - @IBOutlet weak var rhsDice: UIImageView!
   - @IBAction func rollDiceDidTap(_ sender: UIButton)
4. Add dice images to Assets.xcassets with names `dice1`..`dice6`.

## Implementation notes
- Use an array of UIImage or image names and pick random elements to update both image views.
- Configure button appearance (corner radius, background color) in viewDidLoad.
- Implement motionEnded(_:with:) to call the same roll function for shake gestures.

## Running
- Build and run on Simulator or device.
- On device, shake to trigger roll if implemented.
