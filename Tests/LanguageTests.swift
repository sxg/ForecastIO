//
//  LanguageTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class LanguageTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(Language.Arabic.description).to(equal("ar"))
        expect(Language.Belarusian.description).to(equal("be"))
        expect(Language.Bosnian.description).to(equal("bs"))
        expect(Language.Czech.description).to(equal("cs"))
        expect(Language.German.description).to(equal("de"))
        expect(Language.Greek.description).to(equal("el"))
        expect(Language.English.description).to(equal("en"))
        expect(Language.Spanish.description).to(equal("es"))
        expect(Language.French.description).to(equal("fr"))
        expect(Language.Croatian.description).to(equal("hr"))
        expect(Language.Hungarian.description).to(equal("hu"))
        expect(Language.Indonesian.description).to(equal("id"))
        expect(Language.Italian.description).to(equal("it"))
        expect(Language.Icelandic.description).to(equal("is"))
        expect(Language.Cornish.description).to(equal("kw"))
        expect(Language.NorwegianBokmål.description).to(equal("nb"))
        expect(Language.Dutch.description).to(equal("nl"))
        expect(Language.Polish.description).to(equal("pl"))
        expect(Language.Portuguese.description).to(equal("pt"))
        expect(Language.Russian.description).to(equal("ru"))
        expect(Language.Slovak.description).to(equal("sk"))
        expect(Language.Serbian.description).to(equal("sr"))
        expect(Language.Swedish.description).to(equal("sv"))
        expect(Language.Tetum.description).to(equal("tet"))
        expect(Language.Turkish.description).to(equal("tr"))
        expect(Language.Ukrainian.description).to(equal("uk"))
        expect(Language.PigLatin.description).to(equal("x-pig-latin"))
        expect(Language.SimplifiedChinese.description).to(equal("zh"))
        expect(Language.TraditionalChinese.description).to(equal("zh-tw"))
    }

}
