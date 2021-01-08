//
//  ErrorMessage.swift
//  GithubJobs
//
//  Created by taehy.k on 2021/01/08.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Somthing went wrong, try again"
    case invalidResponse = "Server error. Please modify your search and try again"
}
