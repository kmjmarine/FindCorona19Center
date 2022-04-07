//
//  CenterAPIResponse.swift
//  FindCorona19Center
//
//  Created by kmjmarine on 2022/04/08.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
