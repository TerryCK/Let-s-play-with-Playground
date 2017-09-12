
import UIKit
//
//struct BikeStationAPI {
//
//
//    var APIs: Dictionary<City, API> = [
//        .taipei    : API(city: .taipei,      dataType: .json),
//        .newTaipei : API(city: .newTaipei,   dataType: .json),
//        .taoyuan   : API(city: .taoyuan,     dataType: .json),
//        .hsinchu   : API(city: .hsinchu,     dataType: .html),
//        .taichung  : API(city: .taichung,    dataType: .json),
//        .changhua  : API(city: .changhua,    dataType: .html),
//        .tainan    : API(city: .tainan,      dataType: .json),
//        .kaohsiung : API(city: .kaohsiung,   dataType: .xml),
//        .pingtung  : API(city: .pingtung,    dataType: .xml)
//    ]
//}
//
//struct API {
//    var city: City
//    var isHere: Bool = false
//    var dataType: DataType
//
//    init(city: City,  dataType: DataType) {
//        self.city = city
//        self.dataType = dataType
//    }
//}
//
//enum DataType {
//    case xml, json, html
//}
//
//
//enum City: String {
//    case taipei = "http://data.taipei/youbike"
//    case newTaipei = "http://data.ntpc.gov.tw/api/v1/rest/datastore/382000000A-000352-001"
//    case taoyuan = "http://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json"
//    case hsinchu = "http://hccg.youbike.com.tw/cht/f12.php"
//    case taichung = "http://ybjson01.youbike.com.tw:1002/gwjs.json"
//    case changhua = "http://chcg.youbike.com.tw/cht/f12.php"
//    case tainan = "http://tbike.tainan.gov.tw:8081/Service/StationStatus/Json"
//    case kaohsiung = "http://www.c-bike.com.tw/xml/stationlistopendata.aspx"
//    case pingtung = "http://pbike.pthg.gov.tw/xml/stationlist.aspx"
//}
//
//
//
//
//
//let citys: [City] = [.taipei, .pingtung]
//let dic = BikeStationAPI().APIs
//var result =  [API]()
//for city in citys {
//    if let api = dic[city] {
//        result.append(api)
//        print(api.dataType)
//    }
//}
//
//let array = [1,23,4,5,1,2]
//let copy = array
//copy[1]
//











func myPerformeCode() {
    
    // here code to perform
}


//
//let date = Date()
//let calendar = Calendar.current
//let hour = calendar.component(.hour, from: date)
//let minutes = calendar.component(.minute, from: date)
//let seconds = calendar.component(.second, from: date)

protocol Testable { }

extension Testable {
    
    
    
    func response(complete: @escaping (Int)->()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            print("queue")
            complete(10)
        }
        
    }
    
    func function() -> Int {
        var test = 0
        response { (value) in
            test = value + 1
            print(test)
        }
        print(test) // 預計不會執行
        return test
    }
}

class Test: Testable { }
let testClass = Test()
testClass.function()




let array = [1,2,3,4,5,6]
let lastAPI = array.last!
for i in array {
    if i == lastAPI {
        print(i)
    }
}


for (index, value) in array.enumerated() {
    print(index, value)
    
}






import Alamofire




