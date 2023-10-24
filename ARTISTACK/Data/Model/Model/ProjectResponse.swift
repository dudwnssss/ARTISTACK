//
//  Projects.swift
//  Practice_Artistack
//
//  Created by csh on 2022/08/15.
//

import Foundation

struct ProjectResponse : Codable {
    var success: Bool
    var code: Int
    var message: String
    var data: ProjectData
}

struct ProjectData: Codable {
    var content: [Project]
    var pageable: Pageable
    var totalElements: Int
    var totalPages: Int
    var last: Bool
    var number: Int
    var sort: SortedCheck
    var size: Int
    var numberOfElements: Int
    var first: Bool
    var empty: Bool
}

struct Project: Codable {
    var id: Int
    var videoUrl: String
    var title: String?
    var description: String?
    var bpm: String?
    var codeFlow: String?
    var scope: String
    var isStackable: Bool
    var viewCount: Int?
    var prevProjectId: Int?
    var user: UserDTO
    var instruments: [InstrumentDTO]
    var prevStackers: [StackerInfo?]
    var prevStackCount: Int
    var likeCount: Int
    var stackCount: Int
    var isLiked: Bool
}

struct StackerInfo: Codable {
    var nickname: String
    var profileImgUrl: String?
    var instruments: [InstrumentDTO]
}

struct Pageable: Codable {
    var sort: SortedCheck
    var offset: Int
    var pageNumber: Int
    var pageSize: Int
    var paged: Bool
    var unpaged: Bool
}

struct SortedCheck: Codable {
    var empty: Bool
    var sorted: Bool
    var unsorted: Bool
}
