//
//  Post.swift
//  Practice_Artistack
//
//  Created by csh on 2022/07/28.
//

import Foundation

struct PostDTO: Codable {
    var success: Bool
    var code: Int
    var message: String
    var data: PostInfoDTO
}

struct PostInfoDTO: Codable {
    let id: Int
    let videoUrl: String
    let title: String?
    let description: String?
    let bpm: String?
    let codeFlow: String?
    let scope: String
    let isStackable: Bool
    let viewCount: Int?
    let prevProjectId: Int?
    let user: UserDTO
    let instruments: [InstrumentDTO]
    let likeCount: Int
    let stackCount: Int
}



