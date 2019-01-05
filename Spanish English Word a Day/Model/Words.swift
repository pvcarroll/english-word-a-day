//
//  Words.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/15/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import Foundation

struct Words {
    static let words: [Word] = [
        Word(english: "time", spanish: "tiempo"),
        Word(english: "person", spanish: "persona"),
        Word(english: "year", spanish: "año"),
        Word(english: "way", spanish: "el camino/la forma"),
        Word(english: "day", spanish: "día"),
        Word(english: "thing", spanish: "cosa"),
        Word(english: "man", spanish: "hombre"),
        Word(english: "world", spanish: "mundo"),
        Word(english: "life", spanish: "vida"),
        Word(english: "hand", spanish: "mano"),
        Word(english: "part", spanish: "parte"),
        Word(english: "child", spanish: "niño"),
        Word(english: "eye", spanish: "ojo"),
        Word(english: "woman", spanish: "mujer"),
        Word(english: "place", spanish: "lugar"),
        Word(english: "work", spanish: "trabajo"),
        Word(english: "week", spanish: "semana"),
        Word(english: "case", spanish: "caso"),
        Word(english: "point", spanish: "punto"),
        Word(english: "company", spanish: "empresa"),
        Word(english: "number", spanish: "número")
    ]
}

struct Word {
    let english: String
    let spanish: String
}
