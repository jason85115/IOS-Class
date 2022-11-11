//
//  IGeneralDAO.swift
//  Chapter11
//
//  Created by UCOM-02 on 2022/11/11.
//

import Foundation

protocol IGeneralDAO{
    associatedtype T
    func getAll() -> [T]
    func getDataByID(id: Int) -> T?
    func delete(id: Int) -> Bool
    func insert(data: T) -> Bool
    func update(data: T) -> Bool
}
