# LeboncoinChallenge

This project aims to retrieve and show a List of Ads from a given API. 


## Contents

1. [Run LeboncoinChallenge ](#run-leboncoinchallenge)
2. [How to configure LeboncoinChallenge (Optional) ](#how-to-configure-leboncoinchallenge)
3. [Stack used ](#used-stack)
4. [Project structure](#project-structure)



### Run LeboncoinChallenge

```bash
   git clone https://github.com/crpgoncalves/LeboncoinChallenge.git
```



### How to configure LeboncoinChallenge

If you want to change the `BASE_URL`, it's possible either on the `Config.xcconfig` file (to run directly from xCode) or in `Info.plist` to run without xCode.

If you dont do this configuration xCode will use the fallback URL wich is defined on  `Info.plist`.

```
<key>BASE_URL</key>
<string>https://raw.githubusercontent.com/leboncoin/paperclip/master/</string>
```

1. Go to `Product` > `Scheme` > `Edit Scheme`
2. Go to `Run`
3. Select `Arguments` Tab
4. Add the Environment Variable as shown (`BASE_URL` key with value `$(BASE_URL)`)
   
![Screenshot 2025-04-03 at 10 33 02](https://github.com/user-attachments/assets/56a8795a-3fee-4b2a-b2fc-cc082de79030)


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
   - /ADDDetailsScreen
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
  
