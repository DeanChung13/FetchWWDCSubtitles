//
//  FetchSubtitleManager.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

struct FetchSubtitleManager {
  
  private static func downloadContentWithUrl(_ urlString: String,
                                     session: Int,
                                     language lang: Subtitle.Language,
                                     parser: Parser) -> String? {
    
    let subtitleDomainUrlString = urlString
    let subtitlesIndexUrlString = subtitleDomainUrlString.appending("subtitles/\(lang.rawValue)/prog_index.m3u8")
    
    guard let list = try? String(contentsOf: URL(string: subtitlesIndexUrlString)!) else {
      print("Download failed: \(subtitlesIndexUrlString)")
      return nil
    }
    
    let total = parser.totalFilesFrom(list: list)
    if total < 1 {
      print("Parse total fileSequence error, video \(session)")
      return nil
    }
    
    print("Downloading video session_\(session),\(total) files...")
    
    var rawSubtitleString: String = ""
    for index in 0...total {
      let urlString = subtitleDomainUrlString.appending("subtitles/\(lang.rawValue)/fileSequence\(index).webvtt")
      guard let data = try? Data(contentsOf: URL(string:urlString)!) else {
        print("Download fileSequence(\(index) failed")
        return nil
      }
      // 之前Apple的中文字幕有時會用這個編碼 .gb_18030_2000
      guard let dataString = String(data: data, encoding: .utf8) else {
        print("fileSequence(\(index)) text encoding error with UTF-8")
        return nil
      }
      rawSubtitleString = rawSubtitleString.appending(dataString)
    }
    
    return rawSubtitleString
  }
  
  
  /// 下載 WWDC 指定年份的所有影片字幕
  ///
  /// - Parameters:
  ///   - year: 指定年份，可以是 .WWDC2015、.WWDC2016、.WWDC2017
  ///   - lang: 支援語系， .ENG、.CHS
  public static func downloadSubtitles(withYear year: WWDCYear, language lang: Subtitle.Language) {
    guard let urlDicts = getVideoSourceUrlDictsFromYear(year) else {
      print("video sources with \(year) were not exist")
      return
    }
    
    let sortedSessions = urlDicts.keys.sorted()
    
    for session in sortedSessions {
      guard let urlString = urlDicts[session] else {
        continue
      }
      
      guard !isContentExist(year: year, session: session, lang: lang) else {
        continue
      }
      
      let parser = Parser()
      guard let rawSubtitleContent = downloadContentWithUrl(urlString, session:session , language: lang, parser: parser) else {
        continue
      }
      
      let formattedContent = parser.format(rawSubtitleContent)
      
      saveContent(formattedContent, year: year, session: session, lang: lang)
      
    }
    
  }
  
  /// 下載 WWDC 特定年份的單一Session影片字幕
  ///
  /// - Parameters:
  ///   - year: 指定年份，可以是 .WWDC2015、.WWDC2016、.WWDC2017
  ///   - session: 舉例， 408、202
  ///   - lang: 支援語系， .ENG、.CHS
  public static func downloadSubtitle(withYear year: WWDCYear, session: Int, language lang: Subtitle.Language) {
    guard !isContentExist(year: year, session: session, lang: lang) else {
      return
    }
    
    guard let urlString = getVideoSourceUrlFromYear(year, session: session) else {
      return
    }
    
    let parser = Parser()
    guard let rawSubtitleContent = downloadContentWithUrl(urlString, session: session, language: lang, parser: parser) else {
      return
    }
    
    let subtitleFormattedContent = parser.format(rawSubtitleContent)
    
    saveContent(subtitleFormattedContent, year: year, session: session, lang: lang)
  }
  
  private static func saveContent(_ content: String, year: WWDCYear, session: Int, lang: Subtitle.Language) {
    let directory = createDirectory(year: year)
    let filePath = createFilePath(year: year, session: session, lang: lang)
    
    var isDir: ObjCBool = ObjCBool(true)
    let fm = FileManager.default
    
    if fm.fileExists(atPath: directory, isDirectory: &isDir) { }
      else {
      try? fm.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
    }
    
    do {
      try content.write(toFile: filePath,
                        atomically: true,
                        encoding: String.Encoding.utf8)
    } catch {
      print("Save file Failed!, \(error.localizedDescription)")
    }
    print("Done!")
    
  }
  
  private static func createDirectory(year: WWDCYear) -> String {
    return "./WWDC\(year.rawValue)"
  }
  
  private static func createFilePath(year: WWDCYear, session: Int, lang: Subtitle.Language) -> String {
    let directory = createDirectory(year: year)
    return "\(directory)/Session_\(session)_\(lang).srt"
  }
  
  private static func isContentExist(year: WWDCYear, session: Int, lang: Subtitle.Language) -> Bool {
    let filePath = createFilePath(year: year, session: session, lang: lang)
    var isDir: ObjCBool = ObjCBool(false)
    let fm = FileManager.default
    let isExist = fm.fileExists(atPath: filePath, isDirectory: &isDir)
    if isExist {
      print("context exists, \(filePath)")
    }
    return isExist
  }

  private static func getVideoSourceUrlDictsFromYear(_ year: WWDCYear) -> [Int: String]? {
    switch year  {
    case .WWDC2017:
      return VideoSources.WWDC2017.urlDicts
    case .WWDC2016:
      return VideoSources.WWDC2016.urlDicts
    case .WWDC2015:
      return VideoSources.WWDC2015.urlDicts
    }
  }
  
  private static func getVideoSourceUrlFromYear(_ year: WWDCYear, session: Int) -> String? {
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
