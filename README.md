# Project 3 - *Name of App Here*

**Name of your app** is a basic twitter app to read your tweets.

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen. (1pt)
- [x] User can log in. (1pt)
- [x] User can log out. (1pt)
- [x] User stays logged in across restarts. (1pt)
- [x] User can view tweets with the user profile picture, username, and tweet text. (6pts)

The following **bonus** features are implemented:

- [x] User can pull to refresh. (1pt)
- [x] User can load past tweets infinitely. (2pts)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src=
"https://github.com/henrylao/Tw1tt3r-IOS/blob/master/docs/unit-3-demo-v2.gif"
width=400><br>

## Notes
- Creation of login screen by creating the layout from which frontend elements can be connected
to a dedicated class for controlling how the app responds
    - Create storyboard scene
    - Add relevant assets to scene
    - Create dedicated class controller (cocoa touch)
    - Link elems view ctrl + drag
- Create logout handling
- Caching user login info such that user stays logged in even after closign the app
- Loading images and assets via a copy and paste after selected Assets.xcassets
