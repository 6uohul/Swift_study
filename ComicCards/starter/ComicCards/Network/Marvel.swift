
import Moya

public enum Marvel {
  static private let publicKey = "c4f83294a0bd8c8aba092a272d9294fc"
  static private let privateKey = "4bf46bfa3e3360992f2f5da873f0b7a035607bab"
  
  case comics
}

extension Marvel : TargetType {
  public var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/v1/public")!
  }
  
  public var path: String {
    switch self {
    case .comics : return "/comics"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .comics : return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Moya.Task {
    let ts = "\(Date().timeIntervalSince1970)"
      // 1
      let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5
      
      // 2
      let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]
      
      switch self {
      case .comics:
        // 3
        return .requestParameters(
          parameters: [
            "format": "comic",
            "formatType": "comic",
            "orderBy": "-onsaleDate",
            "dateDescriptor": "lastWeek",
            "limit": 50] + authParams,
          encoding: URLEncoding.default)
      }
  }
  
  public var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
  
}
