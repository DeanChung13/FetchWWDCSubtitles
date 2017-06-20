//
//  Parse.swift
//  FetchChsSubtitles
//
//  Created by Dean Chung on 17/06/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

class Parse {
  static let lang = "zho"
  class func content(urlString: String) {
    var urlComponents = urlString.components(separatedBy: "/")
    //    urlComponents.removeLast()
    urlComponents.removeLast()
    let sessionNumber = urlComponents.last
    let urlPath = urlComponents.joined(separator: "/")
    print(urlPath)
    
    let subtitlesIndexUrlString = urlPath.appending("/subtitles/\(lang)/prog_index.m3u8")
    do {
      let list = try String(contentsOf: URL(string: subtitlesIndexUrlString)!)
      let tempArray = list.components(separatedBy: "#")
      guard tempArray.count > 1 else {
        return
      }
      
      let lastString = tempArray[tempArray.count-2]
//      print(lastString)
      let scanner = Scanner(string: lastString)
      var result: NSString?
      scanner.scanUpTo(".webvtt", into: &result)
      
      guard let myString = result?.description else {
        return
      }
      
      guard let index = myString.range(of: "fileSequence")?.upperBound else {
        return
      }
      
      let example = myString.substring(from: index)
        
      if let total = Int(example) {
        print("Downloading video session_\(sessionNumber!),\(total) files...")
        //  http://devstreaming.apple.com/videos/wwdc/2015/711y6zlz0ll/711/
        var result = ""
        for index in 0...total {
          let urlString = urlPath.appending("/subtitles/\(lang)/fileSequence\(index).webvtt")
          let data = try String(contentsOf: URL(string:urlString)!)
          result = result.appending(data)
        }
        let writePath = "./\(sessionNumber!)_\(lang).srt"
        do {
          try result.write(toFile: writePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
          
        }
        print("Done!")
      }
      
    } catch {
    }
    
  }
}

