//
//  main.swift
//  FetchChsSubtitles
//
//  Created by Dean Chung on 29/12/2016.
//  Copyright © 2016 Dean Chung. All rights reserved.
//

import Foundation

let rawUrls = """
https://devstreaming-cdn.apple.com/videos/wwdc/2017/203atfalwz52js4444/203/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/248l3bagtus6l8jwxh/248/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/609ir1t2xrat06i/609/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/242vuobd1jbmqgaxcq/242/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/201fz90p4yq582o/201/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/804imgsi9d6q5n/804/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/221izy8b17y2dtiy/221/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/414qr3121b1oieq/414/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/814w4jr9s0yp3cym8222/814/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/410ozg0v8cc7h/410/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/604r7b4rnjq86/604/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/204kty9amomlmk222/204/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/514tjrrgnguh4k/514/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/810rf5oudq18pus/810/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/215avg3cuo2bu/215/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/706byvveyendgv5l/706/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/235q83l07a9gtq2rhh/235/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/209dzcjsnhy5ju/209/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/236m8wqo6pbcjnqm2k/236/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/708n9dvm3oden/708/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/251txgutnwpkc4740f/251/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/222ijxk2akkrebmr/222/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/809dxbck5y8h8e1/809/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/245ti8oovkx1hl5005/245/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/715gk347h3udl/715/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/238a3uic99uf9c6iw3/238/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/412icy0vh6ays/412/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/229pmdntyv1wd/229/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/214bugobsy7xw94v/214/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/301nfvhdbpifiun/301/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/510lf4jlju5s1/510/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/813vq78d4cyc3/813/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/243eh39ob5y0z0ktg5/243/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/404z7uj3xincdb0/404/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/819bp5li4iugvy222/819/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/812be3ra1bugc3w/812/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/508wdyl5rm2jy9z8/508/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/607x3ix6ocbh8/607/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/705d3czqkho1a6u/705/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/202ximbb9e2dq222/202/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/603anuihzisyb2a3/603/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/515vy4sl7iu70/515/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/605al19s0mq8dhrdv/605/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/237oyga54hirqaeiwg/237/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/411a7o9phe4uekm/411/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/403yv29uwyamwsi222/403/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/719d0c0vj588o/719/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/716op0un8kq3o4n/716/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/246oh3k8zgxi921jxq/246/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/401ugfluogxen0222/401/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/304jud27ysms3xno/304/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/407kc2s6vvx95/407/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/512u8r4crqanrp/512/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/218p1ql8x8ga34/218/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/606n77zpcxs5ir2/606/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/703muvahj3880222/703/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/602pxa6f2vw71ze/602/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/227jjbmtoqrzj00/227/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/231wmbuvx0t3sci6ua/231/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/711d9xpgp3203tlq/711/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/205f4nvkct31tv/205/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/210ihxlzd3oovy9h/210/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/226hm9uasv2xilo/226/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/211r8euwwl9x4/211/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/219okz4tp7uyw5n/219/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/409cjm7echviyzl/409/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/505e36yrkhhfv/505/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/240nyzp1eit4xt84w4/240/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/511tj33587vdhds/511/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/207mg6u1b7mfd02n/207/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/305k3ed4sd37at/305/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/820i9qakfac65nsp/820/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/513fzgbviu23l/513/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/213zpcyn0q9if99c/213/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/815hn3cbczzv55/815/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/816mg1phgy05k3v222/816/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/707h2gkb95cx1l/707/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/217m6q9g9wx6olr/217/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/704rn4fu5zbv1b8s222/704/hls_vod_mvp.m3u8
https://p-events-delivery.akamaized.net/17qopibbefvoiuhbsefvbsefvopihb06/m3u8/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/249alewpia5158ow5k/249/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/224sn8vw625k1e86/224/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/802i3ngpjoeupj/802/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/110agzs7njnnjtee/110/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/503i6plfvfi7o3222/503/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/610b2hmj0oh62l0/610/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/416mytru0s49ohk/416/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/206efq12yy8kg/206/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/608gcvcpr8gs2/608/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/504op4c3001w2f222/504/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/601nzg4idodih222/601/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/717tmz5rl6c2t2k/717/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/823sgu0b9ofbkip/823/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/208tpmh7cwo17vk/208/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/713tkef4yl0sv3k/713/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/225kqn87jg4q699q/225/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/811evqx1dsujdj5222/811/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/821kjtggolzxsv/821/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/718jes6q3aac0f1a/718/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/244ogyk0iqlop3ecdr/244/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/818xw12wzot6au/818/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/808qnk3ctygo5hd/808/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/817p12uvpl9vgt/817/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/250lnw83hnjfutowrg/250/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/228b3suet75j9rt2n/228/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/234otwtryzhno89esd/234/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/220ugyk0ejmva/220/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/302gfkat3b267/302/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/701jvytnoey2yc7222/701/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/501fo36iwi2moz2l222/501/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/408qiszgcawlgvhh/408/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/241iivj8rn2fo3ft0r/241/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/502cdkomuy9vbj4222/502/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/822qxyzd1qk9l222/822/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/303f0u5froddl13/303/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/230lc4n1loob9/230/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/709e7ilkvrjhjr/709/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/712jqzhsxoww3zn/712/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/714nzbj3q51ksj/714/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/216p00nq8fwzed/216/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/102xyar2647hak3e/102/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/405jj1fb4x5ol/405/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/212vz78e2gzl2/212/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/232avezuj9uzy0hh5n/232/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/509v96e4gd96rlqyq/509/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/223ehejg7kebf8wl/223/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/406hi7pbvl7ez0j/406/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/506jgz9rblchh/506/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/413fmx92zo14voet8/413/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/806ph0c9ysyu1/806/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/803gyqggd62btz0/803/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/247yvk4zop0czpm7s6/247/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/710vxa4hl8hyb72/710/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/402ynph39nk5sn4222/402/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/507koao27wdpt/507/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/239jf31ojfabtst2rm/239/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2017/702lyr2y2j09fro222/702/hls_vod_mvp.m3u8
"""

// MARK: load existing subtitle list
class Session {
  var number: Int?
  init(rawString: String) {
    let finalString = rawString.replacingOccurrences(of: "session_", with: "")
    let finalString2 = finalString.replacingOccurrences(of: ".srt", with: "")
    number = Int(finalString2)
  }
}
let rawList = try String(contentsOfFile: "list.txt", encoding: String.Encoding.utf8)
let tempArray = rawList.split(separator: "\n")
let existingList = tempArray.map { rawString -> Int in
  let session = Session(rawString: String(rawString))
  return session.number ?? 0
}

// MARK: parse online subtitles
Parse.lang = .CHT
let urls = rawUrls.split(separator: "\n")
var notExistCount = 0
for urlString in urls {
//for index in 0...10 {
//  Parse.content(urlString: String(urlString))
//  let urlString = urls[index]
  let result = Parse.IsSessionSubtitleExist(m3u8Url: String(urlString))
  if result.exist {
    if existingList.contains(result.sessionNumber) {
      result.alreadyDownloaded = true
    }
  }
  if !result.exist {
    notExistCount += 1
    print("Lang \(Parse.lang): \(result)")
  }
  
  if (result.needToDownload) {
    print("Lang \(Parse.lang): \(result)")
 
    Parse.content(urlString: String(urlString))
  }
}
print("Total \(notExistCount)/\(urls.count) not exist")

//substring(with: result.range(of: "fileSequence")!)

