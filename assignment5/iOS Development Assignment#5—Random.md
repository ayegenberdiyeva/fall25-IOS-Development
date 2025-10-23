# 🎲 iOS Development Assignment — Randomizer App (Favorites)

## 🎯 Goal
Create a **Randomizer** application in UIKit that displays a random favorite item (e.g., flowers, comics, sneakers, animals, landmarks). Practice:
- Using `UIImageView`, `UILabel`, and `UIButton`
- Wiring UI with `IBOutlet` and `IBAction`
- Applying **Auto Layout** for all iPhone sizes
- Structuring and presenting a set of at least **10 items**

---

## 🧰 Requirements

1. **Create a new iOS project**
   - Project name: `RandomizerApp`
   - Interface: Storyboard
   - Language: Swift

2. **UI Setup (Storyboard)**
   - One **`UIImageView`** for the item image.
   - One **`UILabel`** for the item title.
   - One **`UIButton`** (e.g., `Randomize`) to pick a random item.
   - The app must be **well designed** (see *Design Guidelines* below).

3. **Data**
   - Prepare a collection of **at least 10 items** (images + titles).
   - Add corresponding images to **Assets.xcassets** with clear names.
   - Titles should be user-friendly (capitalized, readable).

4. **Connections (ViewController)**
   - Create `IBOutlet` connections for the image view and title label.
   - Create an `IBAction` for the button to:
     - Randomly select an item.
     - Update the UI (image + title).

5. **Auto Layout (Required)**
   - Add **constraints** so the layout adapts to all iPhone sizes and orientations.
   - Suggested rules:
     - Keep the image centered horizontally with a **fixed aspect ratio**.
     - Ensure the label has proper **content hugging** (doesn’t stretch unnecessarily).
     - Button should be reachable and consistently positioned.
     - Use **safe area** guides and reasonable spacing.
   - Test on at least **two device simulators** (e.g., iPhone SE and iPhone 15 Pro Max).

6. **Design Guidelines**
   - Consistent typography and spacing.
   - Proper image **content mode** (e.g., aspect fit/fill) to avoid distortion.
   - Use a balanced **color palette** and readable contrast.
   - Add subtle touches: corner radius, shadow, or a simple card/background.

---

## 🏅 Bonus Task — Item Details (Optional)
Enhance each item with **more details**, such as:
- A short **description** (multi-line text).
- **Attributes** (e.g., origin, year, category, rating).
- Display these details below the title and style them clearly (sections or chips/pills).
- The randomizer should update **all** visible details.

---

## 🧪 Expected Result
- Tapping the **Randomize** button shows a **different item** (image + title) from the set.
- Layout looks **good** and **stable** across devices due to Auto Layout.
- (Bonus) Additional details appear and update along with the random item.

---

## 📤 Submission
- Upload entire Xcode project to git repo.
- Include a short **README.md** with:
  - Item theme chosen (e.g., flowers).
  - Devices tested.
  - Any known limitations.

---