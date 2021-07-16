# Introduction

Some simple functions to calculate dates.
Supports non-gregorian calendars.

Includes some handy extensions.
For example, get the components of a date quickly:

```swift
print(Date().year) //example output: 2021
```

Get the next occurrence of a given date:

```swift
// if today is 2020-5-15
print(nextDay(of: Date()) //output: 2021-5-15
```

Of course, this supports 2-29, which appears every 4 years:

```swift
// if today is 2020-2-29
print(nextDay(of: Date()) //output: 2024-2-29
```

Another function `daysToNextDay(of date: Date)` is for calculating how many days is left before that next occurrence comes.

For example:

```swift
// if today is 2021-5-10 and a date variable called "someDay" is set to 2020-5-15
print(daysToNextDay(of: someDay)) // output: 5
```

# Implementation
To use this, just drag the DateCalc.swift file into your project, and you can use these extensions and functions anywhere.

# P.S.
I am using this in my app, Birthday Notes, which is aviailable on the App Store.
