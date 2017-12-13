//
//  FetchSubtitleManager.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

struct FetchSubtitleManager {
//  let rawUrls = """
//https://devstreaming-cdn.apple.com/videos/wwdc/2017/213zpcyn0q9if99c/213/hls_vod_mvp.m3u8
//https://devstreaming-cdn.apple.com/videos/wwdc/2017/223ehejg7kebf8wl/223/hls_vod_mvp.m3u8
//https://devstreaming-cdn.apple.com/videos/wwdc/2017/227jjbmtoqrzj00/227/hls_vod_mvp.m3u8
//"""
//  
//  // MARK: load existing subtitle list
//  class Session {
//    var number: Int?
//    init(rawString: String) {
//      let finalString = rawString.replacingOccurrences(of: "session_", with: "")
//      let finalString2 = finalString.replacingOccurrences(of: ".srt", with: "")
//      number = Int(finalString2)
//    }
//  }
//  let rawList = try String(contentsOfFile: "list.txt", encoding: String.Encoding.utf8)
//  let tempArray = rawList.split(separator: "\n")
//  let existingList = tempArray.map { rawString -> Int in
//    let session = Session(rawString: String(rawString))
//    return session.number ?? 0
//  }
//
  
  
  
  static func downloadContentWithUrl(_ urlString: String, session: Int, language lang: Subtitle.Language, parser: Parser?) {
    // MARK: parse online subtitles

//    let result = Parse.IsSessionSubtitleExist(m3u8Url: String(urlString))
//    if result.exist {
//      if existingList.contains(result.sessionNumber) {
//        result.alreadyDownloaded = true
//      }
//    }
//    if !result.exist {
    
//      print("Lang \(Parse.lang): \(result)")
//    }

//    if (result.needToDownload) {
//      print("Lang \(Parse.lang): \(result)")

//      Parse.content(urlString: String(urlString))
//    }
    
    let subtitleDomainUrlString = urlString.replacingOccurrences(of: "hls_vod_mvp.m3u8", with: "")
    let subtitlesIndexUrlString = subtitleDomainUrlString.appending("subtitles/\(lang.rawValue)/prog_index.m3u8")
    
    guard let list = try? String(contentsOf: URL(string: subtitlesIndexUrlString)!) else {
      print("Download failed: \(subtitlesIndexUrlString)")
      return
    }
    
    
    guard let total = parser?.totalFilesFrom(list: list) else {
      print("Parse total fileSequence error, \(list)")
      return
    }
    
    print("Downloading video session_\(session),\(total) files...")
    
    var rawSubtitleString: String = ""
    for index in 0...total {
      let urlString = subtitleDomainUrlString.appending("subtitles/\(lang.rawValue)/fileSequence\(index).webvtt")
      guard let data = try? Data(contentsOf: URL(string:urlString)!) else {
        print("Download fileSequence(\(index) failed")
        return
      }
      //          if let dataString = String(data: data, encoding: .gb_18030_2000) {
      guard let dataString = String(data: data, encoding: .utf8) else {
        print("fileSequence(\(index)) text encoding error")
        return
      }
      rawSubtitleString = rawSubtitleString.appending(dataString)
    }
    
    let writePath = "./\(session)_\(lang).srt"
    
    guard let subtitleString = parser?.format(rawSubtitleString) else {
      print("Can't format rawSubtitle")
      return
    }
    
    do {
      try subtitleString.write(toFile: writePath,
                               atomically: true,
                               encoding: String.Encoding.utf8)
    } catch {
      
    }
    print("Done!")
  
    
  }
  
  static func downloadSubtitle(withYear year: Int, session: Int, language lang: Subtitle.Language) {
    // MARK: parse online subtitles
    Parse.lang = lang
    guard let urlString = getVideoSourceUrlFromYear(year, session: session) else {
      return
    }
    
    downloadContentWithUrl(urlString, session: session, language: lang, parser: Parser())
  }
  
  private static func getVideoSourceUrlDictsFromYear(_ year: Int) -> [Int: String]? {
    switch year {
    case 2017:
      return VideoSources.WWDC2017.urlDicts
    case 2016:
      return VideoSources.WWDC2016.urlDicts
    case 2015:
      return VideoSources.WWDC2015.urlDicts
    default:
      return nil
    }
  }
  
  private static func getVideoSourceUrlFromYear(_ year: Int, session: Int) -> String? {
    guard let urlDicts = getVideoSourceUrlDictsFromYear(year) else {
      print("video sources with \(year) were not exist")
      return nil
    }
    
    guard let urlString = urlDicts[session] else {
      print("video session (\(session)) was not exist")
      return nil
    }
    
    return urlString
  }
}
