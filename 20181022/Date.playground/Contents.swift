import Foundation

let calendar = Calendar.current

// Simon Vouet
// 9 January 1590 – 30 June 1649
let vouet =
    DateInterval(start: calendar.date(from:
        DateComponents(year: 1590, month: 1, day: 9))!,
                 end: calendar.date(from:
                    DateComponents(year: 1649, month: 6, day: 30))!)

// Peter Paul Rubens
// 28 June 1577 – 30 May 1640
let rubens =
    DateInterval(start: calendar.date(from:
        DateComponents(year: 1577, month: 6, day: 28))!,
                 end: calendar.date(from:
                    DateComponents(year: 1640, month: 5, day: 30))!)

let overlap = rubens.intersection(with: vouet)!

calendar.dateComponents([.year],
                        from: overlap.start,
                        to: overlap.end) // 50 years
