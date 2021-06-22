//
//  File.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation

public func loadFromBundle<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
        return try parse(data, as: T.self)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
}


public func loadFromURL<T: Decodable>(_ url: URL, as type: T.Type = T.self) throws -> T {
    do {
        let contents = try String(contentsOf: url)
        return try parse(contents.data(using: .utf8)!, as: T.self)
    } catch  {
        //print("Couldn't load data from \(url):\n\(err.localizedDescription)")
        throw ParsingError.fileNotFound
        //return nil
       // fatalError("Couldn't load data from \(url):\n\(error)")
    }
}

public func parse<T: Decodable>(_ data: Data, as type: T.Type = T.self) throws -> T {
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch let err {
        print("PARSING ERROR \(err)")
        print("PARSING ERROR LOC \(err.localizedDescription)")
        throw ParsingError.unableToParseData
       // fatalError("Couldn't parse data:\n\(error)")
    }
}


enum ParsingError: Error {
    case unableToParseData
    case fileNotFound
}

extension ParsingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "Unable to find file or folder"
        case .unableToParseData:
            return "Unable to parse data. Please check JSON data"
        }
    }
}
