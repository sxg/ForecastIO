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
        XCTAssertEqual(Language.Arabic.description, "ar")
        XCTAssertEqual(Language.Belarusian.description, "be")
        XCTAssertEqual(Language.Bosnian.description, "bs")
        XCTAssertEqual(Language.Czech.description, "cs")
        XCTAssertEqual(Language.German.description, "de")
        XCTAssertEqual(Language.Greek.description, "el")
        XCTAssertEqual(Language.English.description, "en")
        XCTAssertEqual(Language.Spanish.description, "es")
        XCTAssertEqual(Language.French.description, "fr")
        XCTAssertEqual(Language.Croatian.description, "hr")
        XCTAssertEqual(Language.Hungarian.description, "hu")
        XCTAssertEqual(Language.Indonesian.description, "id")
        XCTAssertEqual(Language.Italian.description, "it")
        XCTAssertEqual(Language.Icelandic.description, "is")
        XCTAssertEqual(Language.Cornish.description, "kw")
        XCTAssertEqual(Language.NorwegianBokmål.description, "nb")
        XCTAssertEqual(Language.Dutch.description, "nl")
        XCTAssertEqual(Language.Polish.description, "pl")
        XCTAssertEqual(Language.Portuguese.description, "pt")
        XCTAssertEqual(Language.Russian.description, "ru")
        XCTAssertEqual(Language.Slovak.description, "sk")
        XCTAssertEqual(Language.Serbian.description, "sr")
        XCTAssertEqual(Language.Swedish.description, "sv")
        XCTAssertEqual(Language.Tetum.description, "tet")
        XCTAssertEqual(Language.Turkish.description, "tr")
        XCTAssertEqual(Language.Ukrainian.description, "uk")
        XCTAssertEqual(Language.PigLatin.description, "x-pig-latin")
        XCTAssertEqual(Language.SimplifiedChinese.description, "zh")
        XCTAssertEqual(Language.TraditionalChinese.description, "zh-tw")
    }

}
