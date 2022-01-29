//
//  CharacterModel.swift
//  BreakingBadApp
//
//  Created by Pandos on 01.03.2021.
//

struct Character: Decodable {
    let name: String?
    let img: String?
    let occupation: [String]?
    let nickname: String?
    let status: String?
}

enum URLS: String {
    case breakingBadapi = "https://www.breakingbadapi.com/api/characters"
}

