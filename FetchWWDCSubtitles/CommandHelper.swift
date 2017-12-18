//
//  CommandHelper.swift
//  FetchWWDCSubtitles
//
//  Created by DeanChung on 18/12/2017.
//  Copyright © 2017 DeanChung. All rights reserved.
//

import Foundation

struct CommandHelper {
  private func printUsage() {
    writeMessage("Usage:")
    writeMessage("  ./FetchWWDCSubtitles <year> <session> <language>\n")
    writeMessage("Example usage:")
    writeMessage("  ./FetchWWDCSubtitles 2017 408 chs")
    writeMessage("  ./FetchWWDCSubtitles 2017 408 eng")
    writeMessage("  ./FetchWWDCSubtitles 2017 chs")
    writeMessage("  ./FetchWWDCSubtitles 2017 eng")
  }
  
  private enum OutputType {
    case error
    case standard
  }
  
  private func writeMessage(_ message: String, to: OutputType = .standard) {
    switch to {
    case .standard:
      print("\(message)")
    case .error:
      fputs("Error: \(message)\n", stderr)
    }
  }
  
  private func checkCommand() {
    var arguments = CommandLine.arguments
    arguments.removeFirst()
    
    func writeYearErrorMessage() {
      writeMessage("Error: year is not correct, it should be 2015 or 2016 or 2017")
    }
    
    func writeLanguageErrorMessage() {
      writeMessage("Error 2: language is not correct, it should be  chs or eng")
    }
    
    func checkCommandDownloadAllSession() {
      guard let year = Int(arguments[0]), let wwdcYear = WWDCYear(rawValue: year) else {
        writeYearErrorMessage()
        return
      }
      
      let language = arguments[1]
      guard language.searchTextWithRegex("[ceghns]{3}").count > 0 else {
        writeLanguageErrorMessage()
        return
      }
      
      let lang = language == "chs" ? Subtitle.Language.CHS : Subtitle.Language.ENG
      FetchSubtitleManager.downloadSubtitles(withYear: wwdcYear,
                                             language: lang)
    }
    
    func checkCommandDownloadSingleSession() {
      guard let year = Int(arguments[0]), let wwdcYear = WWDCYear(rawValue: year) else {
        writeYearErrorMessage()
        return
      }
      
      guard let session = Int(arguments[1]) else {
        writeMessage("Error 3: session is not Int")
        return
      }
      
      let language = arguments[2]
      guard language.searchTextWithRegex("[ceghns]{3}").count > 0 else {
        writeLanguageErrorMessage()
        return
      }
      
      let lang = language == "chs" ? Subtitle.Language.CHS : Subtitle.Language.ENG
      FetchSubtitleManager.downloadSubtitle(withYear: wwdcYear,
                                            session: session,
                                            language: lang)
    }
    
    switch CommandLine.argc {
    case 3:
      checkCommandDownloadAllSession()
    case 4:
      checkCommandDownloadSingleSession()
    default:
      writeMessage("Error: too much arguments or too less arguments")
    }
  }
  
  public static func check() {
    let command = CommandHelper()
    if CommandLine.argc < 2 {
      command.printUsage()
    } else {
      command.checkCommand()
    }
  }
}
