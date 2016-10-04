//
//  Language.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import Foundation

/// Language in which data from the Dark Sky API will be returned.
///
/// - arabic:             The Arabic language.
/// - azerbaijani:        The Azerbaijani language.
/// - belarusian:         The Belarusian language.
/// - bosnian:            The Bosnian language.
/// - czech:              The Czech language.
/// - german:             The German language.
/// - greek:              The Greek language.
/// - english:            The English language and the default option.
/// - spanish:            The Spanish language.
/// - french:             The French language.
/// - croatian:           The Croatian language.
/// - hungarian:          The Hungarian language.
/// - indonesian:         The Indonesian language.
/// - italian:            The Italian language.
/// - icelandic:          The Icelandic language.
/// - cornish:            The Cornish language.
/// - norwegianBokmål:    The Norwegian Bokmål language.
/// - dutch:              The Dutch language.
/// - polish:             The Polish language.
/// - portuguese:         The Portuguese language.
/// - russian:            The Russian language.
/// - slovak:             The Slovak language.
/// - serbian:            The Serbian language.
/// - swedish:            The Swedish language.
/// - tetum:              The Tetum language.
/// - turkish:            The Turkish language.
/// - ukrainian:          The Ukrainian language.
/// - pigLatin:           The Pig Latin language.
/// - simplifiedChinese:  The simplified Chinese language.
/// - traditionalChinese: The traditional Chinese language.
public enum Language: String {
    case arabic = "ar"
    case azerbaijani = "az"
    case belarusian = "be"
    case bosnian = "bs"
    case czech = "cs"
    case german = "de"
    case greek = "el"
    case english = "en"
    case spanish = "es"
    case french = "fr"
    case croatian = "hr"
    case hungarian = "hu"
    case indonesian = "id"
    case italian = "it"
    case icelandic = "is"
    case cornish = "kw"
    case norwegianBokmål = "nb"
    case dutch = "nl"
    case polish = "pl"
    case portuguese = "pt"
    case russian = "ru"
    case slovak = "sk"
    case serbian = "sr"
    case swedish = "sv"
    case tetum = "tet"
    case turkish = "tr"
    case ukrainian = "uk"
    case pigLatin = "x-pig-latin"
    case simplifiedChinese = "zh"
    case traditionalChinese = "zh-tw"
}
