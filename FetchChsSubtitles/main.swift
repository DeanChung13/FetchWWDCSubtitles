//
//  main.swift
//  FetchChsSubtitles
//
//  Created by Dean Chung on 29/12/2016.
//  Copyright © 2016 Dean Chung. All rights reserved.
//

import Foundation

let sourceList = [
//  "http://devstreaming.apple.com/videos/wwdc/2015/1026npwuy2crj2xyuq11/102/images/102_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/105ncyldc6ofunvsgtan/105/images/105_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/106z3yjwpfymnauri96m/106/images/106_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/104usewvb5m0qbwafx8p/104/images/104_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/802mpzd3nzovlygpbg/802/images/802_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/709jcaer6su/709/images/709_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/801auxyvb1pgtkufjk/801/images/801_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/212mm5ra3oau66/212/images/212_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/112lwa56zromr4h6uf0/112/images/112_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/804eub264zh3x4j9yb/804/images/804_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/408509vyudbqvts/408/images/408_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/301tcfp66f/301/images/301_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/217wu453thu1r1/217/images/217_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2267p2ni281ba/226/images/226_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/233l9q8hj9mw/233/images/233_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/224o6pqmtb4ik/224/images/224_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2048w4vdjhe1i1m/204/images/204_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/232f1zopzycv/232/images/232_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/213w6grumlfm0q/213/images/213_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/234reaz1byqc/234/images/234_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2313dt427pmq/231/images/231_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/209c9277tttlt9/209/images/209_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2058z3fx76huw93/205/images/205_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/22160ycymy0qg/221/images/221_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/214dh5q5d0kswh/214/images/214_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/5048tyhotl6/504/images/504_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/223rmo6dv9hxh/223/images/223_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/216isrjt4ku9w4/216/images/216_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/211dseo3cn0bnw/211/images/211_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2187le7kpyhdff/218/images/218_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/219u3bqgvsz2g/219/images/219_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/222ngkqh58b52/222/images/222_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/212mm5ra3oau66/212/images/212_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/230wt8hs0wt8/230/images/230_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/5091mxk00t/509/images/509_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/207id8oiaxrt6lh/207/images/207_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/208wc2mdvock1md/208/images/208_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/228eahxjbaops/228/images/228_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/2023wpov1sxpnf9/202/images/202_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/220lgx5lvphj2/220/images/220_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/203bxvbtrom9t1t/203/images/203_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/210oyq5peqlavb/210/images/210_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/227s0ti458qgg/227/images/227_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/206v5ce46maax7s/206/images/206_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/225629tzulwe0/225/images/225_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/215972d0hjjcfx/215/images/215_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/229fksrj39nd/229/images/229_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/201pps6n6g0nsnz/201/images/201_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/805yjy11epjkgmnn11/805/images/805_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/802mpzd3nzovlygpbg/802/images/802_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/801auxyvb1pgtkufjk/801/images/801_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/803q4kw6eqia7ssp17/803/images/803_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/804eub264zh3x4j9yb/804/images/804_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/413eflf3lrh1tyo/413/images/413_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/404l17yio30l549x/404/images/404_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/405t69ymgwkmfzc9/405/images/405_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/414sklk5h2k3ki3/414/images/414_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/41097fby32x3opk/410/images/410_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/4072909wwb9o9j3/407/images/407_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/403l7ohdidhmnkgx/403/images/403_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/4097c25o0qhs6g5/409/images/409_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/412rhea5amj6iaf/412/images/412_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/408509vyudbqvts/408/images/408_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/401gee20yy5v2men/401/images/401_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/4119flfsnsgmlfy/411/images/411_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/406o0doszwo8r15m/406/images/406_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/402c0mhxbs8tt52t/402/images/402_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/303qzm09e7/303/images/303_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/306vjwcqnm/306/images/306_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/301tcfp66f/301/images/301_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/302sxabxp0/302/images/302_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/304ywrr62d/304/images/304_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/103ot7lzkdri2fvn1iyh/103/images/103_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/1086gvs7f4vryixs49s6/108/images/108_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/105ncyldc6ofunvsgtan/105/images/105_734x413.jpg",
//  "http://devstreaming.apple.com/videos/wwdc/2015/1014o78qhj07pbfxt9g7/101/images/101_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/1026npwuy2crj2xyuq11/102/images/102_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/112lwa56zromr4h6uf0/112/images/112_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/1075hpxmc54818sn59su/107/images/107_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/106z3yjwpfymnauri96m/106/images/106_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/104usewvb5m0qbwafx8p/104/images/104_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/609pzlyunriyjupp/609/images/609_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/606ui2ppsvalj4nn/606/images/606_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/6053hq2fz0ebo0lm/605/images/605_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/608rpwq1ltvg5nmk/608/images/608_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/602868pb0ow6idb3w/602/images/602_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/610kn68riy9ms89m/610/images/610_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/6037pi9rxl6tfss8w/603/images/603_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/607g5z16fpl7pzgi/607/images/607_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/604gq12qghmv39znb/604/images/604_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/508691kyzp/508/images/508_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/502sufwcpog/502/images/502_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/5062qehwhs/506/images/506_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/503oad8l55m/503/images/503_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/511kmynuza/511/images/511_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/5059xl75l59/505/images/505_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/507pq8rldk/507/images/507_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/510jiccqsz/510/images/510_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/501g8vwlgg2/501/images/501_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/707ysegpumy/707/images/707_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/702lp563ezbr/702/images/702_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/718b7aw9tq/718/images/718_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/710jle9eakx/710/images/710_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/7153rwmu2r/715/images/715_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/708xzs0dtwx/708/images/708_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/709jcaer6su/709/images/709_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/713gc2tqvvb/713/images/713_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/7125ovmdf36/712/images/712_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/711y6zlz0ll/711/images/711_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/703kp2dwbwkr/703/images/703_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/706nu20qkag/706/images/706_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/701i2qis0reg/701/images/701_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/704ci202euy/704/images/704_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/714tqy593v/714/images/714_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/705qrxhfxo0/705/images/705_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/717yq4y85w/717/images/717_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/720xwbi9nl/720/images/720_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2015/719ui2k57m/719/images/719_734x413.jpg"
]

class Parse {
  class func content(urlString: String) {
    var urlComponents = urlString.components(separatedBy: "/")
    urlComponents.removeLast()
    urlComponents.removeLast()
    let sessionNumber = urlComponents.last
    let urlPath = urlComponents.joined(separator: "/")
    print(urlPath)
    
    let subtitlesIndexUrlString = urlPath.appending("/subtitles/zho/prog_index.m3u8")
    do {
      let list = try String(contentsOf: URL(string: subtitlesIndexUrlString)!)
      let tempArray = list.components(separatedBy: "#")
      guard tempArray.count > 1 else {
        return
      }
      
      let lastString = tempArray[tempArray.count-2]
      print(lastString)
      let scanner = Scanner(string: lastString)
      var result: NSString?
      scanner.scanUpTo(".webvtt", into: &result)
      
      let myString: String = result as! String
      let index = myString.range(of: "fileSequence")?.upperBound
      let example = myString.substring(from: index!)
      
      
      if let total = Int(example) {
        print("Downloading video session_\(sessionNumber!),\(total) files...")
        //  http://devstreaming.apple.com/videos/wwdc/2015/711y6zlz0ll/711/
        var result = ""
        for index in 0...total {
          let urlString = urlPath.appending("/subtitles/zho/fileSequence\(index).webvtt")
          let data = try String(contentsOf: URL(string:urlString)!)
          result = result.appending(data)
        }
        let writePath = "./\(sessionNumber!).srt"
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

//if CommandLine.arguments.count != 2 {
//  print("Usage: FetchChsSubtitles Url")
//} else {
//  let urlString = CommandLine.arguments[1]
//  print("Prepare fetch Url: \(urlString)")
////  http://devstreaming.apple.com/videos/wwdc/2015/711y6zlz0ll/711/hls_vod_mvp.m3u8
//  
//}

for urlString in sourceList {
  Parse.content(urlString: urlString)
}
  

//substring(with: result.range(of: "fileSequence")!)

