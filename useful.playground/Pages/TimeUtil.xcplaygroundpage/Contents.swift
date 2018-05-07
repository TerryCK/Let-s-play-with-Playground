
import Foundation
public class BET188 {
    
    public enum StatementQueryPeriod {
        
        case Today, Yesterday, OneWeek, Last30Days, Last90Days
        
        public var from: String {
            switch self {
            case .Today:        return fromToday
            case .Yesterday:    return fromYesterday
            case .OneWeek:      return from1WeekAgo
            case .Last30Days:   return from30DaysAgo
            case .Last90Days:   return from90DaysAgo
            }
        }
        
        public var to: String {
            switch self {
            case .Yesterday:    return fromToday
            default:            return toToday
            }
        }
        
        private var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            return dateFormatter
        }
        
        private var startOfToday: Date {
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(identifier: "UTC")!
            return calendar.startOfDay(for: Date())
        }
        
        private var toToday: String {
            let endOfToday = Calendar.current.date(byAdding: .day, value: 1, to: startOfToday)
            return dateFormatter.string(from: endOfToday!)
        }
        
        private var fromToday: String {
            return dateFormatter.string(from: startOfToday)
        }
        
        private var fromYesterday: String {
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: startOfToday)
            return dateFormatter.string(from: yesterday!)
        }
        
        private var from1WeekAgo: String {
            let aWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: startOfToday)
            return dateFormatter.string(from: aWeekAgo!)
        }
        
        private var from30DaysAgo: String {
            let thirtyDaysAgo = Calendar.current.date(byAdding: .month, value: -1, to: startOfToday)
            return dateFormatter.string(from: thirtyDaysAgo!)
        }
        
        private var from90DaysAgo: String {
            let ninetyDaysAgo = Calendar.current.date(byAdding: .month, value: -3, to: startOfToday)
            return dateFormatter.string(from: ninetyDaysAgo!)
        }
    }
}

var startOfToday: Date {
    var calendar = Calendar.current
    calendar.timeZone = TimeZone(identifier: "UTC")!
    return calendar.startOfDay(for: Date.init(timeIntervalSince1970: 0))
}




var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    return dateFormatter
}



dateFormatter.string(from: Date(timeIntervalSince1970: 0))
dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: 0))

dateFormatter.string(from: Date(timeIntervalSince1970: .nan))
dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: .nan))
Double.greatestFiniteMagnitude // maxima for Double

let x = Double.greatestFiniteMagnitude * 2
x //


let string = "0001-01-01T00:00:00"
var result = dateFormatter.date(from: string)?.timeIntervalSince1970


dateFormatter.string(from: Date(timeIntervalSince1970: .greatestFiniteMagnitude))
dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: .greatestFiniteMagnitude))

dateFormatter.string(from: Date(timeIntervalSince1970: x))
dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: x))

dateFormatter.defaultDate
dateFormatter.date(from: "0")
dateFormatter.string(for: 123)


var (y, n) = ("Terry", "Tony")
print(y)
(n, y) = (y, n)
print(y)
