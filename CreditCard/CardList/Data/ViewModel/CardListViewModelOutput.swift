//
//  CardListViewModelOutput.swift
//  Card
//
//  Created by Aditi jain on 12/12/22.
//
import Foundation

protocol CardListViewModelOutput {
    func success()
    func gotError(_ error: String)
}
