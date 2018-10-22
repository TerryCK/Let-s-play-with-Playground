import Foundation

class SPI {
    enum Member {
        case profile(age: Int)
    }
}


String(describing: type(of: SPI.Member.profile(age: 10)))
String(describing: SPI.Member.profile(age: 10))


protocol WebService {
    associatedtype ServiceError: Error
    func fire(onFailure: ServiceError)
}

enum TestError: Error { case test }

extension WebService where ServiceError == TestError {
    func fire(onFailure: ServiceError) {
        print("TestError")
    }
}
enum SPIError: Error { case noerror }

extension WebService where ServiceError == SPIError {
    func fire(onFailure: ServiceError) {
        print("SPIError")
    }
}

protocol RequestComposer {
    
}
extension RequestComposer {
    
}

enum Member: RequestComposer, WebService  {
    typealias ServiceError = SPIError
    case profile(age: Int)
}


enum Document: WebService, RequestComposer {
     typealias ServiceError = TestError
        case upload(String)
}

enum Router<T: RequestComposer & WebService> {
    case request(T)
    
    func fire(onFailure: T.ServiceError) {
        if case let .request(parameter) = self {
            parameter.fire(onFailure: onFailure)
        }
    }
}
Router.request(Member.profile(age: 10)).fire(onFailure: )

Router.request(Document.upload("")).fire(onFailure: <#T##TestError#>)

Router.request(Member.profile(age: 10)).fire(onFailure: .noerror)

Router.request(Document.upload("")).fire(onFailure: .test)























//
//
//public enum AnyRequest: URLRequestConvertible {
//    case General(RequestComposer)
//    case SPI(RequestComposer)
//
//
//    private static let sessionManager = SessionManager(configuration: SessionManager.sessionConfig)
//
//    private var retrier : Retrier? {
//        switch self {
//        case .General:  return nil
//        default: return Retrier.shared
//        }
//    }
//
//    public func asURLRequest() throws -> URLRequest {
//        let request: RequestComposer
//
//        switch self {
//        case let .General(req): request =  req
//        case let .SPI(req): request =  req
//        }
//
//
//    }
//
//    @discardableResult
//    public func fire<T: Codable>(onSuccess: ((T) -> Void)? = nil, onFailure: ((SPIError) -> Void)? = nil) -> DataRequest {
//        return AnyRequest.sessionManager.with(retrier: retrier).request(self).validate().responseData { (response) in
//            switch response.result {
//            case .failure:
//                onFailure?(SPIError.Connection)
//
//            case .success:
//                if let data = response.data {
//                    self.process(data, success: onSuccess, fail: onFailure)
//                } else {
//                    onFailure?(SPIError.UnrecognizableResult)
//                }
//            }
//        }
//    }
//
//    private func process<T: Codable>(_ result: Data, success: ((T) -> Void)? = nil, fail: ((SPIError) -> Void)? = nil) {
//        do {
//
//            switch self {
//            case .General:
//                success?(try result.decoded(to: T.self))
//
//            case .SPI:
//                let response = try result.decoded(to: Response<T>.self)
//                if response.code == "COMM0000", let body = response.body {
//                    success?(body)
//                } else {
//                    fail?(SPIError.Service(errCode: response.code))
//                }
//            }
//        } catch { fail?(SPIError.UnrecognizableResult) }
//    }
//}
//
//
//



protocol Terry {
    
}

enum TerryX: Terry {
    case Y(Int)
}

extension Terry {
    func H() {
        switch self {
        case .Y (let x): print(x)
        }
        
    }
}


TerryX.Y(10).H()





















