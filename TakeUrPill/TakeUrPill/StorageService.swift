//
//  StorageService.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 11/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Foundation

protocol StorageService {
    func readHistory() throws -> Data
    func deleteHistory() -> Bool
    func store(_ pill: PillType) -> Bool
}

enum HistoryError: Error {
    case generic
    case write
    case read
    case fileEmpty
}

final class Storage: StorageService {
    private let suitName = "group.com.alessioroberto.TakeURPill.Shared"

    func readHistory() throws -> Data {
        if let userDefaults = UserDefaults(suiteName: suitName),
            let history = userDefaults.userHistory {
            return history
        }

        throw HistoryError.fileEmpty
    }

    func deleteHistory() -> Bool {
        if let userDefaults = UserDefaults(suiteName: suitName) {
            userDefaults.userHistory = nil
            return true
        }
        return false
    }

    func readTypes() throws -> Data {
        if let userDefaults = UserDefaults(suiteName: suitName),
            let history = userDefaults.pillsList {
            return history
        }

        throw HistoryError.fileEmpty
    }

    func deleteTypes() -> Bool {
        if let userDefaults = UserDefaults(suiteName: suitName) {
            userDefaults.pillsList = nil
            return true
        }
        return false
    }

    func deleteType(at idx: Int) -> Bool {
        do {
            let json = try readTypes()

            if let list = Convert.convertToPillTypes(json) {
                var newList = list
                newList.remove(at: idx)
                if let newJson = Convert.convertToData(newList) {
                    try saveTypes(newJson)
                }
            }
        } catch {
//            logger("Read Error")
            return false
        }
        return true
    }

    func store(_ pill: PillType) -> Bool {

        do {
            let json = try readTypes()

            if let list = Convert.convertToPillTypes(json) {
                var newList = list
                newList.append(pill)
                if let newJson = Convert.convertToData(newList) {
                    try saveTypes(newJson)
                }
            }
        } catch let error as HistoryError {
            if error == .fileEmpty {
                if let newJson = Convert.convertToData([pill]) {
                    try? saveTypes(newJson)
                }
            } else {
//                logger("\(error.localizedDescription)")
                return false
            }
        } catch {
//            logger("Read Error")
            return false
        }
        return true
    }

    // MARK: - Private
    private func saveHistory(_ data: Data) throws {
        if let userDefaults = UserDefaults(suiteName: suitName) {
            userDefaults.userHistory = data
        } else {
            throw HistoryError.write
        }
    }

    private func saveTypes(_ data: Data) throws {
        if let userDefaults = UserDefaults(suiteName: suitName) {
            userDefaults.pillsList = data
        } else {
            throw HistoryError.write
        }
    }
}

struct Convert {

    static func convertToData<T: Equatable&Codable>(_ pill: T) -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(pill)
    }

    static func convertToData<T: Equatable&Codable>(_ list: [T]) -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(list)
    }

    static func convertToPillType(_ data: Data) -> PillType? {
        let decoder = JSONDecoder()
        return try? decoder.decode(PillType.self, from: data)
    }

    static func convertToPillTypes(_ data: Data) -> [PillType]? {
        let decoder = JSONDecoder()
        return try? decoder.decode([PillType].self, from: data)
    }
}

