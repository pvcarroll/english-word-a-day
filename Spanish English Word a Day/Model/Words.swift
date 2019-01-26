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
        // nouns
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
        Word(english: "number", spanish: "número"),
        Word(english: "yesterday", spanish: "ayer"),
        Word(english: "stores", spanish: "tiendas"),
        Word(english: "building", spanish: "edificio"),
        Word(english: "flavors", spanish: "sabores"),
        Word(english: "government", spanish: "gobierno"),
        Word(english: "country", spanish: "país"),
        Word(english: "state", spanish: "estado"),
        Word(english: "shape", spanish: "forma"),
        Word(english: "case", spanish: "caso"),
        Word(english: "bookstore", spanish: "libraría"),
        Word(english: "success", spanish: "éxito"),
        Word(english: "folder", spanish: "carpeta"),
        Word(english: "as", spanish: "ace"),
        Word(english: "butt", spanish: "culo"),
        
        // pronouns
        Word(english: "us", spanish: "nos"),
        Word(english: "he", spanish: "se"),
        Word(english: "you", spanish: "le"),
        Word(english: "that", spanish: "que"),
        Word(english: "what", spanish: "qué"),
        Word(english: "that", spanish: "eso"),
        Word(english: "this", spanish: "este/esta"),
        Word(english: "that", spanish: "ese/esa"),
        
        // verbs
        Word(english: "to try", spanish: "probar"),
        Word(english: "to bother", spanish: "molestar"),
        Word(english: "to step on", spanish: "pisar"),
        
        // prepositions
        Word(english: "about", spanish: "sobre"),
        Word(english: "between", spanish: "entre"),
        Word(english: "until", spanish: "hasta"),
        Word(english: "from", spanish: "desde"),
        Word(english: "during", spanish: "durante"),
        Word(english: "according to", spanish: "según"),
        Word(english: "against", spanish: "contra"),
        
        // adjective
        Word(english: "sensible", spanish: "sensato/sensata"),
        Word(english: "sensitive", spanish: "sensible"),
        Word(english: "excited", spanish: "emocionado/emocionada"),
        Word(english: "horny", spanish: "excitado/excitada"),
        
        // adverb
        Word(english: "like", spanish: "como"),
        Word(english: "also", spanish: "también"),
        Word(english: "so much / so many", spanish: "tanto"),
        
        // conjunctions
        Word(english: "although", spanish: "aunque")
    ]
}

struct Word {
    let english: String
    let spanish: String
}
