//
//  Language.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import Foundation

/// Language in which data from the Dark Sky API will be returned.
public enum Language: String, CustomStringConvertible {
    ///  The Arabic language.
    case Arabic = "ar"
    
    ///  The Belarusian language.
    case Belarusian = "be"
    
    ///  The Bosnian language.
    case Bosnian = "bs"
    
    ///  The Czech language.
    case Czech = "cs"
    
    ///  The German language.
    case German = "de"
    
    ///  The Greek language.
    case Greek = "el"
    
    ///  The English language and the default option.
    case English = "en"
    
    ///  The Spanish language.
    case Spanish = "es"
    
    ///  The French language.
    case French = "fr"
    
    ///  The Croatian language.
    case Croatian = "hr"
    
    ///  The Hungarian language.
    case Hungarian = "hu"
    
    ///  The Indonesian language.
    case Indonesian = "id"
    
    ///  The Italian language.
    case Italian = "it"
    
    ///  The Icelandic language.
    case Icelandic = "is"
    
    ///  The Cornish language.
    case Cornish = "kw"
    
    ///  The Norwegian Bokmål language.
    case NorwegianBokmål = "nb"
    
    ///  The Dutch language.
    case Dutch = "nl"
    
    ///  The Polish language.
    case Polish = "pl"
    
    ///  The Portuguese language.
    case Portuguese = "pt"
    
    ///  The Russian language.
    case Russian = "ru"
    
    ///  The Slovak language.
    case Slovak = "sk"
    
    ///  The Serbian language.
    case Serbian = "sr"
    
    ///  The Swedish language.
    case Swedish = "sv"
    
    ///  The Tetum language.
    case Tetum = "tet"
    
    ///  The Turkish language.
    case Turkish = "tr"
    
    ///  The Ukrainian language.
    case Ukrainian = "uk"
    
    ///  The Pig Latin language.
    case PigLatin = "x-pig-latin"
    
    ///  The simplified Chinese language.
    case SimplifiedChinese = "zh"
    
    ///  The traditional Chinese language.
    case TraditionalChinese = "zh-tw"
    
    /**
     Returns the `String` value of the enum variant.
     
     - returns: `String` value of the enum variant.
     */
    public var description: String {
        return rawValue
    }
}
