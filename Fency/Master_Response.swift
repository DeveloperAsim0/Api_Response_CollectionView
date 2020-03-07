
import Foundation

public class Master_Response:Codable {
	public var _meta : _meta?
	public var result : Array<Result>?
}

public class _links:Codable {
    public var `self` : Self?
    public var edit : Edit?
    public var avatar : Avatar?
}

public class _meta:Codable {
    public var success : Bool?
    public var code : Int?
    public var message : String?
    public var totalCount : Int?
    public var pageCount : Int?
    public var currentPage : Int?
    public var perPage : Int?
    public var rateLimit : RateLimit?
}

public class Avatar:Codable {
    public var href : String?
}

public class Edit:Codable {
    public var href : String?
}

public class RateLimit:Codable {
    public var limit : Int?
    public var remaining : Int?
    public var reset : Int?
}

public class Result:Codable {
    public var id : String?
    public var first_name : String?
    public var last_name : String?
    public var gender : String?
    public var dob : String?
    public var email : String?
    public var phone : String?
    public var website : String?
    public var address : String?
    public var status : String?
    public var _links : _links?
}

public class `Self`:Codable {
    public var href : String?
}
