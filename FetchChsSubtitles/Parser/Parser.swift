//
//  Parser.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

struct Parser {
  func totalFilesFrom(list: String) -> Int {
    let tempArray = list.components(separatedBy: "#")
    guard tempArray.count > 1 else {
      print("Subtitle index file error: \(list)")
      return 0
    }
    
    let lastString = tempArray[tempArray.count-2]
    //      print(lastString)
    let scanner = Scanner(string: lastString)
    var result: NSString?
    scanner.scanUpTo(".webvtt", into: &result)
    
    guard let myString = result?.description else {
      return 0
    }
    
    guard let index = myString.range(of: "fileSequence")?.upperBound else {
      return 0
    }
    
    guard let total = Int(myString.substring(from: index)) else {
      print("Can't get total fileSequence count")
      return 0
    }
    return total
  }
  
  func format(_ rawSubtitle: String) -> String {
    
    var tempArray = rawSubtitle.components(separatedBy: "\n")
    
    removeUnnecessaryHeader(tempArray: &tempArray)
    
    var list = [Subtitle.Line]()
    list.append(Subtitle.Line(number: 0, time: "00:00:00,000 --> 00:00:01,000"))
    
    var lineNumber = 1
    var line: Subtitle.Line?
    var previousLine: Subtitle.Line?
    for text in tempArray {
      if text != "" {
        if text.hasPrefix("0") {
          line = Subtitle.Line(number: lineNumber, time: text)
        } else {
          line?.addContent(text)
        }
      } else {
        if let newLine = line {
          if let newPreviousLine = previousLine  {
            if newLine.time != newPreviousLine.time {
              list.append(newLine)
            } else {
    //              print("duplicate line: \(newLine.description)")
            }
          } else {
            list.append(newLine)
          }
          previousLine = line
          line = nil
          lineNumber += 1
        }
      }
    }
    
    if let lastLine = line {
      list.append(lastLine)
    }
    
    let finalContent = list.map(){ $0.description }.joined(separator: "\n\n")
    
    return finalContent
  }
  
  func removeUnnecessaryHeader(tempArray: inout [String]) {
    let removeString1 = "WEBVTT"
    let removeString2 = "X-TIMESTAMP-MAP=MPEGTS:181083,LOCAL:00:00:00.000"
    
    while tempArray.contains(removeString1) ||
      tempArray.contains(removeString2) {
      if let index = tempArray.index(of: removeString1) {
        tempArray.remove(at: index)
      }
      
      if let index = tempArray.index(of: removeString2) {
        tempArray.remove(at: index)
      }
    }
  }
}
