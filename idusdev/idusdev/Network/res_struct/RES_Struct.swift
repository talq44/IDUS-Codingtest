//
//  RES_Struct.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import Foundation

// 메인 데이터 선언

struct RES_Result:Codable{
    var resultCount:Int? // ":10,
    var results:[Appstore_Info]?
    init ( from decoder: Decoder ) throws {
        let container = try decoder.container( keyedBy: CodingKeys.self )
        resultCount = ( try? container.decode( Int.self, forKey: .resultCount ))
        results = ( try? container.decode( [Appstore_Info].self, forKey: .results ))
    }
}

struct Appstore_Info:Codable{
    
    var artworkUrl60:String?
    var artworkUrl512:String?
    var artworkUrl100:String?
    var artistViewUrl:String?
    var isGameCenterEnabled:Bool?
    var kind:String?
    var trackCensoredName:String?
    var fileSizeBytes : String?
    var contentAdvisoryRating : String?
    var averageUserRatingForCurrentVersion : Double?
    var userRatingCountForCurrentVersion : String?
    var averageUserRating : String?
    var trackViewUrl : String?
    var trackContentRating : String?
    var trackName : String?
    var trackId : String?
    var releaseDate : String?
    var formattedPrice : String?
    var primaryGenreName : String?
    var isVppDeviceBasedLicensingEnabled : String?
    var currentVersionReleaseDate : String?
    var releaseNotes : String?
    var primaryGenreId : String?
    var sellerName : String?
    var minimumOsVersion : String?
    var currency : String?
    var description : String?
    var artistId : String?
    var artistName : String?
    var price : String?
    var bundleId : String?
    var version : String?
    var wrapperType : String?
    var userRatingCount : String?
    
    var screenshotUrls:[String]?
    var ipadScreenshotUrls:[String]?
    var appletvScreenshotUrls:[String]?
    var supportedDevices:[String]?
    var advisories:[String]?
    var features:[String]?
    var languageCodesISO2A:[String]?
    var genreIds:[String]?
    var genres:[String]?
    
    init ( from decoder: Decoder ) throws {
        let container = try decoder.container( keyedBy: CodingKeys.self )
        artworkUrl60 = ( try? container.decode( String.self, forKey: .artworkUrl60 ))
        artworkUrl512 = ( try? container.decode( String.self, forKey: .artworkUrl512 ))
        artworkUrl100 = ( try? container.decode( String.self, forKey: .artworkUrl100 ))
        artistViewUrl = ( try? container.decode( String.self, forKey: .artistViewUrl ))
        isGameCenterEnabled = ( try? container.decode( Bool.self, forKey: .isGameCenterEnabled ))
        kind = ( try? container.decode( String.self, forKey: .kind ))
        trackCensoredName = ( try? container.decode( String.self, forKey: .trackCensoredName ))
        fileSizeBytes = ( try? container.decode( String.self, forKey: .fileSizeBytes ))
        contentAdvisoryRating = ( try? container.decode( String.self, forKey: .contentAdvisoryRating ))
        averageUserRatingForCurrentVersion = ( try? container.decode( Double.self, forKey: .averageUserRatingForCurrentVersion ))
        userRatingCountForCurrentVersion = ( try? container.decode( String.self, forKey: .userRatingCountForCurrentVersion ))
        averageUserRating = ( try? container.decode( String.self, forKey: .averageUserRating ))
        trackViewUrl = ( try? container.decode( String.self, forKey: .trackViewUrl ))
        trackContentRating = ( try? container.decode( String.self, forKey: .trackContentRating ))
        trackName = ( try? container.decode( String.self, forKey: .trackName ))
        trackId = ( try? container.decode( String.self, forKey: .trackId ))
        releaseDate = ( try? container.decode( String.self, forKey: .releaseDate ))
        formattedPrice = ( try? container.decode( String.self, forKey: .formattedPrice ))
        primaryGenreName = ( try? container.decode( String.self, forKey: .primaryGenreName ))
        isVppDeviceBasedLicensingEnabled = ( try? container.decode( String.self, forKey: .isVppDeviceBasedLicensingEnabled ))
        currentVersionReleaseDate = ( try? container.decode( String.self, forKey: .currentVersionReleaseDate ))
        releaseNotes = ( try? container.decode( String.self, forKey: .releaseNotes ))
        primaryGenreId = ( try? container.decode( String.self, forKey: .primaryGenreId ))
        sellerName = ( try? container.decode( String.self, forKey: .sellerName ))
        minimumOsVersion = ( try? container.decode( String.self, forKey: .minimumOsVersion ))
        currency = ( try? container.decode( String.self, forKey: .currency ))
        description = ( try? container.decode( String.self, forKey: .description ))
        artistId = ( try? container.decode( String.self, forKey: .artistId ))
        artistName = ( try? container.decode( String.self, forKey: .artistName ))
        price = ( try? container.decode( String.self, forKey: .price ))
        bundleId = ( try? container.decode( String.self, forKey: .bundleId ))
        version = ( try? container.decode( String.self, forKey: .version ))
        wrapperType = ( try? container.decode( String.self, forKey: .wrapperType ))
        userRatingCount = ( try? container.decode( String.self, forKey: .userRatingCount ))
        
        screenshotUrls = ( try? container.decode( [String].self, forKey: .screenshotUrls ))
        ipadScreenshotUrls = ( try? container.decode( [String].self, forKey: .ipadScreenshotUrls ))
        appletvScreenshotUrls = ( try? container.decode( [String].self, forKey: .appletvScreenshotUrls ))
        supportedDevices = ( try? container.decode( [String].self, forKey: .supportedDevices ))
        advisories = ( try? container.decode( [String].self, forKey: .advisories ))
        features = ( try? container.decode( [String].self, forKey: .features ))
        languageCodesISO2A = ( try? container.decode( [String].self, forKey: .languageCodesISO2A ))
        genreIds = ( try? container.decode( [String].self, forKey: .genreIds ))
        genres = ( try? container.decode( [String].self, forKey: .genres ))
    }
}
