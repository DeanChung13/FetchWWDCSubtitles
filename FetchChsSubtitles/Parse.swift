//
//  Parse.swift
//  FetchChsSubtitles
//
//  Created by Dean Chung on 17/06/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

class ParseResult: CustomStringConvertible {
  var exist = false
  let sessionNumber: Int
  var alreadyDownloaded: Bool = false
  var description: String {
    let checkString = exist ? "exist" : "not exist"
    let downloadString = alreadyDownloaded ? ", already downloaded" : ""
    return "Session \(sessionNumber) \(checkString) \(downloadString)"
  }
  var needToDownload: Bool {
    get {
      return (!alreadyDownloaded && exist)
    }
  }
  init(sessionNumber: String) {
    self.sessionNumber = Int(sessionNumber) ?? 0
  }
}

class Parse {
  
  static var lang: Subtitle.Language = .ENG
  class func IsSessionSubtitleExist(m3u8Url urlString: String) -> ParseResult {
    
    var urlComponents = urlString.components(separatedBy: "/")
    urlComponents.removeLast()
    let sessionNumber = String(describing:urlComponents.last!)
    let result = ParseResult(sessionNumber: sessionNumber)
  
    let urlPath = urlComponents.joined(separator: "/")
    let subtitlesIndexUrlString = urlPath.appending("/subtitles/\(lang.rawValue)/prog_index.m3u8")
    
    do {
      let list = try String(contentsOf: URL(string: subtitlesIndexUrlString)!)
      let tempArray = list.components(separatedBy: "#")
      guard tempArray.count > 1 else {
        return result
      }
      
      let lastString = tempArray[tempArray.count-2]
      let scanner = Scanner(string: lastString)
      var scannerResult: NSString?
      scanner.scanUpTo(".webvtt", into: &scannerResult)
      
      guard let myString = scannerResult?.description else {
        return result
      }
      
      guard myString.range(of: "fileSequence")?.upperBound != nil else {
        return result
      }
      
      result.exist = true
    } catch {
      return result
    }
    return result
  }
  
  class func content(urlString: String) {
    var urlComponents = urlString.components(separatedBy: "/")
    //    urlComponents.removeLast()
    urlComponents.removeLast()
    let sessionNumber = urlComponents.last
    let urlPath = urlComponents.joined(separator: "/")
    print(urlPath)
    
    let subtitlesIndexUrlString = urlPath.appending("/subtitles/\(lang.rawValue)/prog_index.m3u8")
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
          let urlString = urlPath.appending("/subtitles/\(lang.rawValue)/fileSequence\(index).webvtt")
          let data = try Data(contentsOf: URL(string:urlString)!)
//          if let dataString = String(data: data, encoding: .gb_18030_2000) {
          if let dataString = String(data: data, encoding: .utf8) {
            result = result.appending(dataString)
          } else {
            print("text encoding error")
          }
        }
        let writePath = "./\(sessionNumber!)_\(lang).srt"
        do {
          try result.write(toFile: writePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
          
        }
        print("Done!")
      }
      
    } catch let error {
      print("Error: \(error.localizedDescription)")
    }
    
  }
}

//extension String.Encoding {
//  static let gb_18030_2000 = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue)))
//}
//


