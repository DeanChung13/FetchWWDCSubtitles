//
//  String+Additions.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

extension String {
  func searchTextWithRegex(_ regex: String) -> [String] {
    do {
      let regex = try NSRegularExpression(pattern: regex)
      let results = regex.matches(in: self,
                                  range: NSRange(self.startIndex..., in: self))
      return results.map {
        String(self[Range($0.range, in: self)!])
      }
    } catch let error {
      print("invalid regex: \(error.localizedDescription)")
      return []
    }
  }
}

extension String.Encoding {
  static let gb_18030_2000 = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue)))
}
