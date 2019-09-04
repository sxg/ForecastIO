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
        // Given
        // When
        // Then
        XCTAssertEqual(Language.arabic.rawValue, "ar")
        XCTAssertEqual(Language.azerbaijani.rawValue, "az")
        XCTAssertEqual(Language.belarusian.rawValue, "be")
        XCTAssertEqual(Language.bulgarian.rawValue, "bg")
        XCTAssertEqual(Language.bengali.rawValue, "bn")
        XCTAssertEqual(Language.bosnian.rawValue, "bs")
        XCTAssertEqual(Language.catalan.rawValue, "ca")
        XCTAssertEqual(Language.czech.rawValue, "cs")
        XCTAssertEqual(Language.danish.rawValue, "da")
        XCTAssertEqual(Language.german.rawValue, "de")
        XCTAssertEqual(Language.greek.rawValue, "el")
        XCTAssertEqual(Language.english.rawValue, "en")
        XCTAssertEqual(Language.esperanto.rawValue, "eo")
        XCTAssertEqual(Language.spanish.rawValue, "es")
        XCTAssertEqual(Language.estonian.rawValue, "et")
        XCTAssertEqual(Language.finnish.rawValue, "fi")
        XCTAssertEqual(Language.french.rawValue, "fr")
        XCTAssertEqual(Language.hebrew.rawValue, "he")
        XCTAssertEqual(Language.hindi.rawValue, "hi")
        XCTAssertEqual(Language.croatian.rawValue, "hr")
        XCTAssertEqual(Language.hungarian.rawValue, "hu")
        XCTAssertEqual(Language.indonesian.rawValue, "id")
        XCTAssertEqual(Language.icelandic.rawValue, "is")
        XCTAssertEqual(Language.italian.rawValue, "it")
        XCTAssertEqual(Language.japanese.rawValue, "ja")
        XCTAssertEqual(Language.georgian.rawValue, "ka")
        XCTAssertEqual(Language.kannada.rawValue, "kn")
        XCTAssertEqual(Language.korean.rawValue, "ko")
        XCTAssertEqual(Language.cornish.rawValue, "kw")
        XCTAssertEqual(Language.latvian.rawValue, "lv")
        XCTAssertEqual(Language.malayam.rawValue, "ml")
        XCTAssertEqual(Language.marathi.rawValue, "mr")
        XCTAssertEqual(Language.norwegianBokmål.rawValue, "nb")
        XCTAssertEqual(Language.dutch.rawValue, "nl")
        XCTAssertEqual(Language.punjabi.rawValue, "pa")
        XCTAssertEqual(Language.polish.rawValue, "pl")
        XCTAssertEqual(Language.portuguese.rawValue, "pt")
        XCTAssertEqual(Language.romanian.rawValue, "ro")
        XCTAssertEqual(Language.russian.rawValue, "ru")
        XCTAssertEqual(Language.slovak.rawValue, "sk")
        XCTAssertEqual(Language.slovenian.rawValue, "sl")
        XCTAssertEqual(Language.serbian.rawValue, "sr")
        XCTAssertEqual(Language.swedish.rawValue, "sv")
        XCTAssertEqual(Language.tamil.rawValue, "ta")
        XCTAssertEqual(Language.telugu.rawValue, "te")
        XCTAssertEqual(Language.tetum.rawValue, "tet")
        XCTAssertEqual(Language.turkish.rawValue, "tr")
        XCTAssertEqual(Language.ukrainian.rawValue, "uk")
        XCTAssertEqual(Language.urdu.rawValue, "ur")
        XCTAssertEqual(Language.pigLatin.rawValue, "x-pig-latin")
        XCTAssertEqual(Language.simplifiedChinese.rawValue, "zh")
        XCTAssertEqual(Language.traditionalChinese.rawValue, "zh-tw")
    }

}
