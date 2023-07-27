import Foundation

final class DateConverter {
    static func convert(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        let dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: string)
    }
}
