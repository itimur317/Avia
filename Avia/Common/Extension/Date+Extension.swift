import Foundation

extension Date {    
    var hourMinutes: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        return hour.toTwoDecimals + ":" + minutes.toTwoDecimals
    }
    
    var dayMonthWeekday: String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let weekday = calendar.component(.weekday, from: self)
        return "\(day) \(month.monthName), \(weekday.weekdayName)"
    }
}

private extension Int {
    var toTwoDecimals: String {
        self / 10 == 0
        ? "0\(self)"
        : "\(self)"
    }
    
    var monthName: String {
        let months = [
            "янв",
            "фев",
            "мар",
            "апр",
            "май",
            "июн",
            "июл",
            "авг",
            "сен",
            "окт",
            "ноя",
            "дек"
        ]
        return months[self - 1]
    }
    
    var weekdayName: String {
        let weekdays = [
            "вс",
            "пн",
            "вт",
            "ср",
            "чт",
            "пт",
            "сб"
        ]
        return weekdays[self - 1]
    }
}
