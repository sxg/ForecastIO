//
//  LanguageTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
@testable import ForecastIO

class LanguageTests: XCTestCase {

    func testRawValue() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Language.arabic.rawValue, "ar")
        XCTAssertEqual(Language.belarusian.rawValue, "be")
        XCTAssertEqual(Language.bosnian.rawValue, "bs")
        XCTAssertEqual(Language.czech.rawValue, "cs")
        XCTAssertEqual(Language.german.rawValue, "de")
        XCTAssertEqual(Language.greek.rawValue, "el")
        XCTAssertEqual(Language.english.rawValue, "en")
        XCTAssertEqual(Language.spanish.rawValue, "es")
        XCTAssertEqual(Language.french.rawValue, "fr")
        XCTAssertEqual(Language.croatian.rawValue, "hr")
        XCTAssertEqual(Language.hungarian.rawValue, "hu")
        XCTAssertEqual(Language.indonesian.rawValue, "id")
        XCTAssertEqual(Language.italian.rawValue, "it")
        XCTAssertEqual(Language.icelandic.rawValue, "is")
        XCTAssertEqual(Language.cornish.rawValue, "kw")
        XCTAssertEqual(Language.norwegianBokmål.rawValue, "nb")
        XCTAssertEqual(Language.dutch.rawValue, "nl")
        XCTAssertEqual(Language.polish.rawValue, "pl")
        XCTAssertEqual(Language.portuguese.rawValue, "pt")
        XCTAssertEqual(Language.russian.rawValue, "ru")
        XCTAssertEqual(Language.slovak.rawValue, "sk")
        XCTAssertEqual(Language.serbian.rawValue, "sr")
        XCTAssertEqual(Language.swedish.rawValue, "sv")
        XCTAssertEqual(Language.tetum.rawValue, "tet")
        XCTAssertEqual(Language.turkish.rawValue, "tr")
        XCTAssertEqual(Language.ukrainian.rawValue, "uk")
        XCTAssertEqual(Language.pigLatin.rawValue, "x-pig-latin")
        XCTAssertEqual(Language.simplifiedChinese.rawValue, "zh")
        XCTAssertEqual(Language.traditionalChinese.rawValue, "zh-tw")
    }

}
