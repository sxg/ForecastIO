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

    func testDescription() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Language.arabic.description, "ar")
        XCTAssertEqual(Language.belarusian.description, "be")
        XCTAssertEqual(Language.bosnian.description, "bs")
        XCTAssertEqual(Language.czech.description, "cs")
        XCTAssertEqual(Language.german.description, "de")
        XCTAssertEqual(Language.greek.description, "el")
        XCTAssertEqual(Language.english.description, "en")
        XCTAssertEqual(Language.spanish.description, "es")
        XCTAssertEqual(Language.french.description, "fr")
        XCTAssertEqual(Language.croatian.description, "hr")
        XCTAssertEqual(Language.hungarian.description, "hu")
        XCTAssertEqual(Language.indonesian.description, "id")
        XCTAssertEqual(Language.italian.description, "it")
        XCTAssertEqual(Language.icelandic.description, "is")
        XCTAssertEqual(Language.cornish.description, "kw")
        XCTAssertEqual(Language.norwegianBokmål.description, "nb")
        XCTAssertEqual(Language.dutch.description, "nl")
        XCTAssertEqual(Language.polish.description, "pl")
        XCTAssertEqual(Language.portuguese.description, "pt")
        XCTAssertEqual(Language.russian.description, "ru")
        XCTAssertEqual(Language.slovak.description, "sk")
        XCTAssertEqual(Language.serbian.description, "sr")
        XCTAssertEqual(Language.swedish.description, "sv")
        XCTAssertEqual(Language.tetum.description, "tet")
        XCTAssertEqual(Language.turkish.description, "tr")
        XCTAssertEqual(Language.ukrainian.description, "uk")
        XCTAssertEqual(Language.pigLatin.description, "x-pig-latin")
        XCTAssertEqual(Language.simplifiedChinese.description, "zh")
        XCTAssertEqual(Language.traditionalChinese.description, "zh-tw")
    }

}
