//
//  main.swift
//  FetchChsSubtitles
//
//  Created by Dean Chung on 29/12/2016.
//  Copyright © 2016 Dean Chung. All rights reserved.
//

import Foundation

let sourceList = [
//  "http://devstreaming.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/images/102_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/208j30f4v1a1i9i5fg9/208/images/208_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/206a38wgme6uponcuwd/206/images/206_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/703rx8zlfedjfom6l93/703/images/703_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/402h429l9d0hy98c9m6/402/images/402_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/302f5hkfjyg13j84oda/302/images/302_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/701q0pnn0ietcautcrv/701/images/701_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/204t23fvanrkj7a1oj7/204/images/204_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/202w2zhc4l8yomptqnt/202/images/202_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/228a1kbxogojm4fviqc/228/images/228_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/216v55u6zpxizxkml6k/216/images/216_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/227a480gfx4hwinv5x9/227/images/227_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/235dk9q4a4mflq2dbms/235/images/235_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/231bhrh1z1fzrejhbz7/231/images/231_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/239ebj00keggvd2m2fx/239/images/239_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/212s41rh77qgdg26s86/212/images/212_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/229b09xkrv3t6tdzwsu/229/images/229_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/230b83wfxc7m69dm90q/230/images/230_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/225e97ww3majsu3bvt8/225/images/225_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/214b51jlndqja1bpptt/214/images/214_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/215e597a1en6wrh89hm/215/images/215_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/237e12rha4rg2t0p53u/237/images/237_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/209e37d5ks3pfj21ij5/209/images/209_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/213r47rtymgcyythv7w/213/images/213_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/240f49ca5uvbzg5pwk5/240/images/240_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/201h1g4asm31ti2l9n1/201/images/201_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/217x5143f51ztsxao1u/217/images/217_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/218e59uvbkp1smncrss/218/images/218_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/220c6lnr7wkcjewnj1g/220/images/220_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/222l873ttj77llkzbzs/222/images/222_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/233c3uhytv8cxwoanja/233/images/233_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/223j90dqr7q1xyld1mv/223/images/223_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/210e4481b1cnwor4n1q/210/images/210_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/238eemv232k9lp2px30/238/images/238_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/221l723gdmjyvv5pmw7/221/images/221_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/241fgk9sdmxcb6c6wz2/241/images/241_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/211m4cro5y3rrsfzfdj/211/images/211_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/202w2zhc4l8yomptqnt/202/images/202_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/236dnxhy85jkit108dh/236/images/236_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/203x2w42att1kdzg1ce/203/images/203_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/205n2okotvilcayc8rc/205/images/205_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/242vdhuk4hmwrxnb465/242/images/242_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/207i37356qcyyh2yxos/207/images/207_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/232biqdny8x84wjag07/232/images/232_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/234dvn2mhmc3klk7vy4/234/images/234_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/219g66mxt0n74iogsgp/219/images/219_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/206a38wgme6uponcuwd/206/images/206_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/208j30f4v1a1i9i5fg9/208/images/208_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/226aey4ryxex6rvqvn1/226/images/226_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/204t23fvanrkj7a1oj7/204/images/204_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/224g9mui5qb06o6ukpf/224/images/224_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/804zpr8et6qv87n8j1z/804/images/804_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/802z6j79sd7g5drr7k7/802/images/802_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/801y753jw8vxmjblocq/801/images/801_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/805zlxpfexwwzt7x0cr/805/images/805_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/803z7m1ln9vmbpg35x9/803/images/803_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/409jh83sf1h8dqrt00q/409/images/409_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/407itxn2ujs52fwcgw5/407/images/407_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/417kbvnnlivhyfnn98p/417/images/417_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/404hskg1ijeev16mdej/404/images/404_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/415kvwo632dbu5csn3g/415/images/415_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/408j7syjtdlxnl2rq4j/408/images/408_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/413jz6eb2wkfuzwx1me/413/images/413_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/406i3zbazbegkeh0udt/406/images/406_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/420lbx5afix4io0xo9p/420/images/420_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/419lgbsyhjrmqtmq0qh/419/images/419_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/403hb0ie2m86hvs7yyn/403/images/403_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/411jge60tmuuh7dolja/411/images/411_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/412jzguxz4h8hykgjlm/412/images/412_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/416k7f0xkmz28rvlvwb/416/images/416_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/418kmcxcwg4psxzsjuy/418/images/418_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/414k6h6qdzyihpowpaa/414/images/414_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/410jaf5ko3ob8asajlf/410/images/410_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/405i2ilotov3bazyei1/405/images/405_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/402h429l9d0hy98c9m6/402/images/402_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/401hmew12wifry4svvi/401/images/401_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/304heg1mrvxxz5lhd4h/304/images/304_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/301fbtjd9exjetky78s/301/images/301_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/302f5hkfjyg13j84oda/302/images/302_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/303g7ecrjttz4lpqd7y/303/images/303_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/305h9fsce1kcqkvmtvk/305/images/305_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/103m0752oxdkymyk6gy/103/images/103_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/104b1061nbty638w2cd/104/images/104_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/101g0jrsvv5qcoduisk/101/images/101_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/108h16qehvq9hdjuf96/108/images/108_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/images/102_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/106r1nsdtsnrih7t6id/106/images/106_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/105o1y9n857rpjpmu27/105/images/105_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/602o05a86ysk0ngvlgj/602/images/602_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/603oba298b1v4z54011/603/images/603_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/606oluchfgwakjbymy8/606/images/606_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/609pxdzx9vsps1l0qdh/609/images/609_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/607odzb3n443nv9ei5p/607/images/607_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/612qhqi7kh3399jwhy7/612/images/612_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/601nsio90cd7ylwimk9/601/images/601_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/611qdyg26bqfivpaww1/611/images/611_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/608p3mqohp4bat0id7s/608/images/608_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/604oezpg3wmqrkxl0t7/604/images/604_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/605ooaey8tbzegv8fth/605/images/605_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/610p9xtklo7t2au11md/610/images/610_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/511nqyciexman7sf932/511/images/511_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/506ms2tv71tcduwp3dm/506/images/506_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/503lkp4vimgv7tqecn7/503/images/503_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/501l32ujtbnw2ad06wy/501/images/501_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/507n0zrhzxdzmg20zcl/507/images/507_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/502lezynlddsti4drbq/502/images/502_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/505mia12r7dwmk3aumw/505/images/505_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/509n1cnykqms19r9jyp/509/images/509_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/508nbofuzf16hljuwqe/508/images/508_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/510ndmh9wkcvzneegv2/510/images/510_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/504m956dgg4hlw2uez9/504/images/504_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/708tbh8wnspsg01hxwx/708/images/708_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/703rx8zlfedjfom6l93/703/images/703_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/720w6g8t9zhd23va0ai/720/images/720_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/716vyncka4gcaxxwuvq/716/images/716_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/725xk1hwmcfqkiv0jfh/725/images/725_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/722x2eefo3u2rp8k8qs/722/images/722_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/723x16j75lwkg414uxk/723/images/723_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/709tvxadw201avg5v7n/709/images/709_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/713uqrvfj3uo0xewc37/713/images/713_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/705s57mrvm8so193i8c/705/images/705_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/701q0pnn0ietcautcrv/701/images/701_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/707s77u9e6pv0dy9ggm/707/images/707_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/711tlraheg74mofg3uq/711/images/711_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/714urluxe140lardrb7/714/images/714_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/715v2nxofqo5an4q79a/715/images/715_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/719wve0t1j24kny0f9r/719/images/719_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/721wh2etddp4ghxhpcg/721/images/721_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/702rhpkb0ux7uuzixps/702/images/702_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/710tkhyprou9hhbnc6g/710/images/710_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/706sgjvzkvg6rrg9icw/706/images/706_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/724x4wbpmrtkjpgfdlj/724/images/724_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/704s1a6rjyi2dqhhyi7/704/images/704_734x413.jpg",
  "http://devstreaming.apple.com/videos/wwdc/2016/712ugi7vg8jznn3pc3u/712/images/712_734x413.jpg"]

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

