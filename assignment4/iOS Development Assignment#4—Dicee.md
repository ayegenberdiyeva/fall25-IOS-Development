# 📱 iOS Development Assignment — Dicee App

## 🎯 Goal
Create a simple **Dicee** application using UIKit that demonstrates:
- Working with `UIImageView` and `UIButton`
- Connecting UI elements with `IBOutlet` and `IBAction`
- Handling basic user interactions
- Updating UI programmatically

---

## 🧰 Requirements

1. **Create a new iOS project**
   - Project name: `DiceeApp`
   - Interface: Storyboard
   - Language: Swift

2. **UI Setup (Storyboard)**  
   - Add **two `UIImageView`** components to the main view.  
     - One for the left dice  
     - One for the right dice  
   - Add **one `UIButton`** below the images with the title `Roll`.
   - ✅ No need to use constraints (manual positioning is allowed for simplicity).

3. **Connect UI to Code**  
   - Create two `IBOutlet` connections for the left and right dice image views.  
   - Create one `IBAction` connection for the button.  
   - The button action should change both dice images randomly when pressed.

4. **Dice Images**
   - Add images for dice faces to your **Assets.xcassets** (`dice1`–`dice6`).  
   - Update the image views when the button is tapped to show random dice faces.

---

## 🏅 Bonus Task — “Shake to Roll” *(Optional)*

Add extra interactivity:
- When running the app on a **real physical device**, trigger the dice roll automatically when:
  - The user shakes the device

---

## 🧪 Expected Result
- Tapping the **Roll** button changes both dice images randomly.  
- Dice images are displayed correctly without constraints.  
- (Bonus) Shaking triggers the same behavior.

---

## 📤 Submission
- Upload your project to Git repository.
---

🧠 *Tip: Your app should be perfect designed as UI/UX concepts.*