//
//  Jobs.swift
//  GithubJobs
//
//  Created by taehy.k on 2021/01/08.
//

import Foundation

struct Jobs: Codable {
    var type: String?
    var url: String?
    var createdAt: String?
    var company: String
    var companyUrl: String?
    var location: String?
    var title: String
    var description: String?
    var howToApply: String?
    var companyLogo: String?
}
