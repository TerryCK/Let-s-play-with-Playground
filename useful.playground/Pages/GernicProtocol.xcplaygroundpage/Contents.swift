//
//import Foundation
//
//struct DataSourceRacingDetail : Codable {
//
//    var bet: RacingDetailBet
//}
//
//struct RacingDetailBet : Codable {
//
//    var betPart : [RacingDetailBetPart]
//}
//
//struct RacingDetailBetAdjustment : Codable {
//
//    var stake: Int
//    var payout: Double
//    var percentage: Double
//    var timestamp: String
//    var type: String
//}
//
//struct RacingDetailBetPart : Codable {
//
//    let name: String
//}
//
//class DataSourceRacing {
//
//
//    var detail: DataSourceRacingDetail = DataSourceRacingDetail(bet: RacingDetailBet(betPart: [RacingDetailBetPart(name: "GG")]))
//
//
//
//    var strTotalStake: String = ""
//
//    var strMaxPayout: String = ""
//    var strDateTime: String = ""
//
//    var isTimeFixed = false
//    var isSystemBet = false
//    var sbtBetType = ""
//    var strMaxWin = ""
////    func isAntePostVisible(index: Int) -> Bool {
////        guard let detailBet = self.detail?.bet else {
////            return false
////        }
////
////        let betPart = detailBet.betPart[index]
////
////        return !betPart.antePost.isEmpty
////    }
//}
//let datasourceRacing = DataSourceRacing()
//
//let g = datasourceRacing.detail.bet.betPart[0].name.isEmpty


var isNotificationsEnabled: String {
        return #function
}

isNotificationsEnabled

