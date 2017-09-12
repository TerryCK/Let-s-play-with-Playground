/// closure
import Foundation

typealias Response = String

typealias CompleteHandler = (Data?, Response?, Error?) -> Void

class URLSessionCustom {
    static let shard = URLSessionCustom()
    func dataTask(_ url: URL, complete: @escaping CompleteHandler) -> URLSessionDataTask {
        DispatchQueue.global().async {
            complete(Data(),"404", nil)
        }
        return URLSessionDataTask()
    }
}


URLSessionCustom.shard.dataTask(URL(string: "http://")!) { data, res, err in
    print(res!)
}
