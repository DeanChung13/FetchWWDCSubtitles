//
//  VideoSources.swift
//  FetchChsSubtitles
//
//  Created by DeanChung on 13/12/2017.
//  Copyright © 2017 Dean Chung. All rights reserved.
//

import Foundation

struct VideoSources {
  private static func convertRawUrlsToUrlDicts(rawUrls: String) -> [Int: String] {
    let urls = rawUrls.split(separator: "\n")
  
    var dict: [Int: String] = [:]
    for url in urls {
      
      guard var session = String(url).searchTextWithRegex("/[0-9]{3}/").last else {
        print("Can't find session string from \(url)")
        break
      }
  
      let range = url.range(of: session)
      guard let endIndex = range?.upperBound else {
        print("Can't get string index from url, \(url)")
        break
      }
      
      let domainUrl = url[..<endIndex]
      
      session = String(session.dropFirst())
      session = String(session.dropLast())
    
      guard let sessionNumber = Int(session) else {
        print("Can't convert session string (\(session)) to Int format")
        break
      }
      
      dict[sessionNumber] = String(domainUrl)
    }
    return dict
  }
  
  struct WWDC2017 {
    static var urlDicts: [Int: String] = {
      return VideoSources.convertRawUrlsToUrlDicts(rawUrls: rawUrls)
    }()
    static let rawUrls = """
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
    // https://p-events-delivery.akamaized.net/17qopibbefvoiuhbsefvbsefvopihb06/m3u8/hls_vod_mvp.m3u8 // WWDC 2017 Keynote
  }
  
  struct WWDC2016 {
    static var urlDicts: [Int: String] = {
      return VideoSources.convertRawUrlsToUrlDicts(rawUrls: rawUrls)
    }()
    private static let rawUrls = """
http://devstreaming.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/images/102_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/208j30f4v1a1i9i5fg9/208/images/208_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/206a38wgme6uponcuwd/206/images/206_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/703rx8zlfedjfom6l93/703/images/703_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/402h429l9d0hy98c9m6/402/images/402_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/302f5hkfjyg13j84oda/302/images/302_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/701q0pnn0ietcautcrv/701/images/701_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/204t23fvanrkj7a1oj7/204/images/204_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/202w2zhc4l8yomptqnt/202/images/202_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/228a1kbxogojm4fviqc/228/images/228_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/216v55u6zpxizxkml6k/216/images/216_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/227a480gfx4hwinv5x9/227/images/227_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/235dk9q4a4mflq2dbms/235/images/235_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/231bhrh1z1fzrejhbz7/231/images/231_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/239ebj00keggvd2m2fx/239/images/239_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/212s41rh77qgdg26s86/212/images/212_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/229b09xkrv3t6tdzwsu/229/images/229_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/230b83wfxc7m69dm90q/230/images/230_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/225e97ww3majsu3bvt8/225/images/225_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/214b51jlndqja1bpptt/214/images/214_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/215e597a1en6wrh89hm/215/images/215_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/237e12rha4rg2t0p53u/237/images/237_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/209e37d5ks3pfj21ij5/209/images/209_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/213r47rtymgcyythv7w/213/images/213_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/240f49ca5uvbzg5pwk5/240/images/240_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/201h1g4asm31ti2l9n1/201/images/201_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/217x5143f51ztsxao1u/217/images/217_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/218e59uvbkp1smncrss/218/images/218_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/220c6lnr7wkcjewnj1g/220/images/220_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/222l873ttj77llkzbzs/222/images/222_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/233c3uhytv8cxwoanja/233/images/233_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/223j90dqr7q1xyld1mv/223/images/223_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/210e4481b1cnwor4n1q/210/images/210_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/238eemv232k9lp2px30/238/images/238_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/221l723gdmjyvv5pmw7/221/images/221_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/241fgk9sdmxcb6c6wz2/241/images/241_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/211m4cro5y3rrsfzfdj/211/images/211_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/202w2zhc4l8yomptqnt/202/images/202_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/236dnxhy85jkit108dh/236/images/236_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/203x2w42att1kdzg1ce/203/images/203_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/205n2okotvilcayc8rc/205/images/205_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/242vdhuk4hmwrxnb465/242/images/242_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/207i37356qcyyh2yxos/207/images/207_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/232biqdny8x84wjag07/232/images/232_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/234dvn2mhmc3klk7vy4/234/images/234_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/219g66mxt0n74iogsgp/219/images/219_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/206a38wgme6uponcuwd/206/images/206_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/208j30f4v1a1i9i5fg9/208/images/208_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/226aey4ryxex6rvqvn1/226/images/226_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/204t23fvanrkj7a1oj7/204/images/204_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/224g9mui5qb06o6ukpf/224/images/224_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/804zpr8et6qv87n8j1z/804/images/804_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/802z6j79sd7g5drr7k7/802/images/802_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/801y753jw8vxmjblocq/801/images/801_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/805zlxpfexwwzt7x0cr/805/images/805_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/803z7m1ln9vmbpg35x9/803/images/803_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/409jh83sf1h8dqrt00q/409/images/409_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/407itxn2ujs52fwcgw5/407/images/407_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/417kbvnnlivhyfnn98p/417/images/417_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/404hskg1ijeev16mdej/404/images/404_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/415kvwo632dbu5csn3g/415/images/415_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/408j7syjtdlxnl2rq4j/408/images/408_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/413jz6eb2wkfuzwx1me/413/images/413_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/406i3zbazbegkeh0udt/406/images/406_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/420lbx5afix4io0xo9p/420/images/420_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/419lgbsyhjrmqtmq0qh/419/images/419_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/403hb0ie2m86hvs7yyn/403/images/403_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/411jge60tmuuh7dolja/411/images/411_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/412jzguxz4h8hykgjlm/412/images/412_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/416k7f0xkmz28rvlvwb/416/images/416_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/418kmcxcwg4psxzsjuy/418/images/418_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/414k6h6qdzyihpowpaa/414/images/414_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/410jaf5ko3ob8asajlf/410/images/410_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/405i2ilotov3bazyei1/405/images/405_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/402h429l9d0hy98c9m6/402/images/402_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/401hmew12wifry4svvi/401/images/401_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/304heg1mrvxxz5lhd4h/304/images/304_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/301fbtjd9exjetky78s/301/images/301_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/302f5hkfjyg13j84oda/302/images/302_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/303g7ecrjttz4lpqd7y/303/images/303_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/305h9fsce1kcqkvmtvk/305/images/305_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/103m0752oxdkymyk6gy/103/images/103_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/104b1061nbty638w2cd/104/images/104_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/101g0jrsvv5qcoduisk/101/images/101_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/108h16qehvq9hdjuf96/108/images/108_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/images/102_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/106r1nsdtsnrih7t6id/106/images/106_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/105o1y9n857rpjpmu27/105/images/105_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/602o05a86ysk0ngvlgj/602/images/602_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/603oba298b1v4z54011/603/images/603_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/606oluchfgwakjbymy8/606/images/606_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/609pxdzx9vsps1l0qdh/609/images/609_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/607odzb3n443nv9ei5p/607/images/607_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/612qhqi7kh3399jwhy7/612/images/612_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/601nsio90cd7ylwimk9/601/images/601_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/611qdyg26bqfivpaww1/611/images/611_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/608p3mqohp4bat0id7s/608/images/608_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/604oezpg3wmqrkxl0t7/604/images/604_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/605ooaey8tbzegv8fth/605/images/605_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/610p9xtklo7t2au11md/610/images/610_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/511nqyciexman7sf932/511/images/511_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/506ms2tv71tcduwp3dm/506/images/506_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/503lkp4vimgv7tqecn7/503/images/503_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/501l32ujtbnw2ad06wy/501/images/501_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/507n0zrhzxdzmg20zcl/507/images/507_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/502lezynlddsti4drbq/502/images/502_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/505mia12r7dwmk3aumw/505/images/505_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/509n1cnykqms19r9jyp/509/images/509_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/508nbofuzf16hljuwqe/508/images/508_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/510ndmh9wkcvzneegv2/510/images/510_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/504m956dgg4hlw2uez9/504/images/504_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/708tbh8wnspsg01hxwx/708/images/708_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/703rx8zlfedjfom6l93/703/images/703_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/720w6g8t9zhd23va0ai/720/images/720_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/716vyncka4gcaxxwuvq/716/images/716_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/725xk1hwmcfqkiv0jfh/725/images/725_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/722x2eefo3u2rp8k8qs/722/images/722_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/723x16j75lwkg414uxk/723/images/723_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/709tvxadw201avg5v7n/709/images/709_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/713uqrvfj3uo0xewc37/713/images/713_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/705s57mrvm8so193i8c/705/images/705_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/701q0pnn0ietcautcrv/701/images/701_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/707s77u9e6pv0dy9ggm/707/images/707_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/711tlraheg74mofg3uq/711/images/711_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/714urluxe140lardrb7/714/images/714_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/715v2nxofqo5an4q79a/715/images/715_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/719wve0t1j24kny0f9r/719/images/719_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/721wh2etddp4ghxhpcg/721/images/721_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/702rhpkb0ux7uuzixps/702/images/702_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/710tkhyprou9hhbnc6g/710/images/710_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/706sgjvzkvg6rrg9icw/706/images/706_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/724x4wbpmrtkjpgfdlj/724/images/724_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/704s1a6rjyi2dqhhyi7/704/images/704_734x413.jpg
http://devstreaming.apple.com/videos/wwdc/2016/712ugi7vg8jznn3pc3u/712/images/712_734x413.jpg
"""
  }
  
  struct WWDC2015 {
    static var urlDicts: [Int: String] = {
      return VideoSources.convertRawUrlsToUrlDicts(rawUrls: rawUrls)
    }()
    static let rawUrls = ""
  }
}
