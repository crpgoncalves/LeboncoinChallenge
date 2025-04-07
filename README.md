# LeboncoinChallenge

This project aims to retrieve and show a List of Ads from a given API. 


## Contents

1. [Run LeboncoinChallenge ](#run-leboncoinchallenge)
2. [How to configure LeboncoinChallenge (Optional) ](#how-to-configure-leboncoinchallenge)
3. [Stack used ](#used-stack)
4. [Project structure](#project-structure)
5. [Run tests](#run-tests)



### Run LeboncoinChallenge

```bash
   git clone https://github.com/crpgoncalves/LeboncoinChallenge.git
```

Open `LeboncoinChallenge.xcodeproj` and run project

### How to configure LeboncoinChallenge

If you want to change the `BASE_URL` in `Info.plist`.

```
<key>BASE_URL</key>
<string>https://raw.githubusercontent.com/leboncoin/paperclip/master/</string>
```


### Used Stack

- **Swift 5.x**
- **SwiftUI**
- **Combine**
- **iOS 16+**


### Project Structure

- **Config** - Contains configurations files.
- **Network** - Contains all logic, models and services to retreive data from API.  
- **Screens** - Contains screens and associated view models.
- **Theme** - Light/dark mode support
- **Utils** - Contains helpers to format dates, prices, localization and association between AD and Category.
- **Views** - Contains views used on screens
- **LeboncoinTests** - Unit testing


```plaintext
/Config
   - Config.xcconfig
   - Info.plist

/Network
   - /ImageLoading
   - /Models
   - /Services
   - NetworkClient.swift
   - NetworkConfigurationProvider.swift
   - ...

/Screens
   - /ADDetailsScreen
   - /LauchScreen
   - /ListScreen

/Utils
   - /AdCategoryAssociationService
   - /DateHelper
   - /LocalizedString
   - /PriceFormatter

/Views

/LeboncoinTests
```

### Run Tests

To run all unit tests 
```bash
   Cmd + U
```
