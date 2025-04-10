# LeboncoinChallenge

This project aims to retrieve and show a List of Ads from a given API. 


## Contents

1. [LeboncoinChallenge Screens](#leboncoinchallenge-screens)
2. [Run LeboncoinChallenge ](#run-leboncoinchallenge)
3. [Used Stack](#used-stack)
4. [Project structure](#project-structure)
5. [Run tests](#run-tests)

# LeboncoinChallenge Screens

## List of Ads -> Can be filtered by name and/or category

<img src="https://github.com/user-attachments/assets/b689bace-1871-4c99-9795-55fde6533a46" width="300"/>

  
## Ad Detail -> Show details of an Ad

<img src="https://github.com/user-attachments/assets/348d0ccb-b835-4567-86f7-2f3feba99167" width="300"/>

## Network error retrieving data

<img src="https://github.com/user-attachments/assets/79d465af-07e8-4ad9-a51b-54fd788ba3a9" width="300"/>

### It supports **iPad** and **iPhone** in both landscape and portrait orientations.

## Run LeboncoinChallenge

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


## Used Stack

- **Swift 5**
- **SwiftUI**
- **Combine**
- **iOS 16+**


## Project Structure

- **Config** - Contains configurations files.
- **Network** - Contains all logic, models and services to retreive data from API.  
- **Screens** - Contains screens and associated view models.
- **Theme** - Light/dark mode support
- **Utils** - Contains helpers to format dates, prices, localization and association between AD and Category.
- **Views** - Contains views used on screens
- **LeboncoinTests** - Unit testing


```plaintext
/Config
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

## Run Tests

To run all unit tests 
```bash
   Cmd + U
```
