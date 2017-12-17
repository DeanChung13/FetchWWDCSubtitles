//
//  Subtitle.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

struct Subtitle {
  enum Language: String {
    case ENG = "eng"
    case CHS = "zho"
  }
  
  struct Line {
    let number: Int
    let time: String
    var content = [String]()
    
    var description: String {
      let contentString = content.joined(separator: "\n")
      return "\(time)\n\(contentString)"
    }
    
    var onlyWords: String {
      let contentString = content.joined(separator: "")
      return contentString
    }
    
    init(number: Int, time: String) {
      self.number = number
      let matched = time.searchTextWithRegex("[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}")
      
      guard let newTime = matched.last else {
        self.time = time
        return
      }
      self.time = newTime
    }
    
    mutating func addContent(_ newContent: String) {
      var text = newContent.replacingOccurrences(of: "<c.magenta>", with: "")
      text = text.replacingOccurrences(of: "</c>", with: "")
      text = text.replacingOccurrences(of: "&gt;&gt; ", with: "")
      text = text.replacingOccurrences(of: "<c.green>", with: "")
      content.append(text)
    }
  }
}
