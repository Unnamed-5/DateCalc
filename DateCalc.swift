// Calculate the next occurence of a given date and how many days left before that comes.


let cal = Calendar.autoupdatingCurrent
let greCal = Calendar(identifier: .gregorian)

extension Date {
    
    var hour: Int {
        cal.component(.hour, from: self)
    }
    var minute: Int {
        cal.component(.minute, from: self)
    }
    var year: Int {
        cal.component(.year, from: self)
    }
    var month: Int {
        cal.component(.month, from: self)
    }
    var day: Int {
        cal.component(.day, from: self)
    }
    
    var startOfDay: Date {
        cal.startOfDay(for: self)
    }
    
}

func nextDay(of date: Date) -> Date {
    
    let today = Date().startOfDay
    
    let currentYear = greCal.component(.year, from: today)
    let currentMonth = greCal.component(.month, from: today)
    let currentDay = greCal.component(.day, from: today)
    
    let isLeapYear = (currentYear % 4 == 0 && currentYear % 100 != 0) || (currentYear % 400 == 0)
    
    let month = date.month
    let day = date.day
    
    let monthPassed = month < currentMonth
    let sameMonth = month == currentMonth
    let datePassed = monthPassed || (sameMonth && (day < currentDay))
    
    var nextDateComponents = greCal.dateComponents([.month, .day], from: date)
    if datePassed {
        nextDateComponents.year = currentYear + 1
    } else {
        nextDateComponents.year = currentYear
    }
    
    var nextLeapYear = currentYear
    
    if isLeapYear { nextLeapYear = currentYear + 1 }
    
    while !((nextLeapYear % 4 == 0 && nextLeapYear % 100 != 0) || (nextLeapYear % 400 == 0)) {
        nextLeapYear += 1
    }
    
    let is0229 = month == 2 && day == 29
    
    if is0229 {
        if isLeapYear {
            if !datePassed {
                nextDateComponents.year = currentYear
            } else {
                nextDateComponents.year = nextLeapYear
            }
        } else {
            nextDateComponents.year = nextLeapYear
        }
    }
    
 	let nextDay = greCal.date(from: nextDateComponents)!.startOfDay
    
    return nextDay
}