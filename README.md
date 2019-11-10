
# mcLogin
A Swift application for connecting to an external Login API to authenticate user and load user specific page. Built in Swift.

# Get Started
Simply,
```
open mcLogin.xcodeproj
```
Best viewed on XCode 11 (dark mode compatibility) or later. 
Select mcLogin target, under Signing & Capabilities, choose your organization team, enable automatic signing and build for your device.

![Open Application - Light mode](http://f.cl.ly/items/2h3b2E0u3t2v2J0Q0c0i/1.png)

![Login Screen - Light Mode](http://f.cl.ly/items/180d0q2u273c0Y1V1P2L/2.png)

![Successful Login - Light Mode](http://f.cl.ly/items/040z0B1o3p1O273c1C29/3.png)

![Open Application - Dark Mode](http://f.cl.ly/items/3f263s0t332a0c192a2a/4.png)

![Login Screen - Dark Mode](http://f.cl.ly/items/0A4103473v3m310L0t1d/5.png)

![Successful Login - dark Mode](http://f.cl.ly/items/1h3C2f3D152O1n2Z3a2r/6.png)

![Unsuccessful Login - Light Mode](http://f.cl.ly/items/112d1F0B1O391y1g1j1o/7.png)

![Typing with keyboard - Light Mode](http://f.cl.ly/items/1M1V1E3z2F1y1Y280O1h/8.png)

# Screens

**This application has two screens.**

1. Login screen -> LoginViewController

2. Dashboard screen after successful login -> DashboardViewController


**Anticipated Flows:**

1. App open > LoginViewController> DashboardViewController

2. App open > DashboardViewController automatic handoff by LoginViewController

**Additional Classes:**
ResponseTokenData - To map data from JSON Response


**Additional Swift files:**
Utility - Contains commonly used functionalities like presenting alert, etc
KeyboardLayoutConstraint - To shift view when keyboard appears
APIClient - To make API calls and get called  by delegate methods

## Known Issues
**Dark Mode** - Though the application is dark mode compatible, few assets lacking transparency don't fit

**No caching or memory cleaning** of any sort

**No unit testing test cases** - Though, the application has been unit tested manually, with consistent debugging.

## Assumptions
All data coming from API is accurate and full.

Added a logout button on Dashboard to make testing easier. Once logged in, logout needs to be pressed to log out.
