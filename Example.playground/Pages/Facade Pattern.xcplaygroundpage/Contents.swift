import Foundation

protocol TravelTask{
    
}
struct Hotel: TravelTask  {
}

struct HotelBooking {
    static func getHotelNameForDates(from: Date, to: Date) -> [Hotel]? {
        let hotels = [Hotel]()
    
        // bussiness logic
        return hotels
    }
    static func bookHotel(hotel: Hotel) {
//        logic for reseve hotel room
    }
}

struct Flight: TravelTask {
    
}

extension TravelTask {
    static func getDataForDates(from: Date, to: Date) -> [Self]? {
        return [Self]
    }
}



struct FlightBooking {
    static func getHotelNameForDates(from: Date, to: Date) -> [Flight]? {
        let flights = [Flight]()
        
        // bussiness logic
        return flights
    }
    
    static func book(flight: Flight) {
        //        logic for reseve flight
    }
}
