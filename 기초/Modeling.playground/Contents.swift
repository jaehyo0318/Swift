import UIKit

struct Course {
    let courseId: Int
    
    // Instance Property
    let title: String // 상수 저장 속성, Stored Property
    let subTitle: String
    
    let cardImgUrlStr: String
    // let cardImgUrl: URL, 계산 속성, Co,puted Property
    var cardImgUrl: URL? {
        URL(string: cardImgUrlStr)
        // 읽기 전용 계산 속성, read-only computed property
    }
    
    let thumbnailImgUrlStr: String?
    var thunbnailImgUrl: URL? {
        guard let str = thumbnailImgUrlStr else { return nil }
        
        return URL(string: str)
    }
    
    let avgReviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = avgReviewScore else { return nil }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        return formatter.string(for: score)
    }
    
    let isCertificationAvailable: Bool
    
    var isFree: Bool {
        return price == nil
    }
    
    let lectureCount: Int
    
    let totalDuration: Int
    var totalDurationStr: String? {
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        
        return formatter.string(from: TimeInterval(totalDuration))
    }
    
    let priority: Int
    
    let isPublic: Bool
    
    let period: Int?
    
    let price: Double?
    let discountedPrice: Double?
    
    var priceString: String? {
        guard let price else { return "무료" }
    
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "Ko_kr")
        
        if let discountedPrice {
            return formatter.string(for: discountedPrice)
        }
        
        return formatter.string(for: price)
    }
    
}

struct Camp {
    let campId: Int

    let title: String
    let subTitle: String

    let cardImgUrlStr: String

    var cardImgUrl: URL? {
        URL(string: cardImgUrlStr)
    }

    let thumbnailImgUrlStr: String?
    var thunbnailImgUrl: URL? {
        guard let str = thumbnailImgUrlStr else { return nil }

        return URL(string: str)
    }

    let avgReviewScore: Double?
    var reviewScoreStr: String? {
        guard let score = avgReviewScore else { return nil }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1

        return formatter.string(for: score)
    }

    let isCertificationAvailable: Bool

    let startDate: Date
    var startDateString: String? {
        let formatter = DateFormatter()
        //        formatter.dateStyle = .full
        //        formatter.timeStyle = .none
        
        // nsDateFormatter
        formatter.dateFormat = "M월 d일 개강"
        formatter.locale = Locale(identifier: "ko_kr")

        return formatter.string(from: startDate)
    }

    let endDate: Date
    var endDateString: String? {
        let formatter = DateFormatter()
        //        formatter.dateStyle = .full
        //        formatter.timeStyle = .none
        
        // nsDateFormatter
        formatter.dateFormat = "M월 d일 개강"
        formatter.locale = Locale(identifier: "ko_kr")

        return formatter.string(from: endDate)
    }
    
    let isOnlineCamp: Bool

    let locationUrl: URL?

    let latitude: Double?
    let longitude: Double?
    
    // Nested Type
    // Camp.Status
    enum Status: String {
        case preparingForOpening    = "개강 준비중"
        case recruiting             = "모집중"
        case recruitingEnded        = "모집마감"
        case onGoing                = "개강중"
        case ended                  = "종강"
    }
    
    let status: Status // Camp.Status, Camp안에서는 Camp.생략가능
    let generation: Int
    var statusString: String? {
        return "\(generation)기 \(status.rawValue)"
    }

    let priority: Int

    let isPublic: Bool

    let period: Int?

    let price: Double?
    let discountedPrice: Double?

    var priceString: String? {
        guard let price else { return "무료" }

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "Ko_kr")

        if let discountedPrice {
            return formatter.string(for: discountedPrice)
        }

        return formatter.string(for: price)
    }
}



