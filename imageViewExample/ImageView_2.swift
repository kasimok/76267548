//
//  ImageView_2.swift
//  imageViewExample
//
//  Created by 0x67 on 2023-05-17.
//

import Foundation
import SwiftUI

struct ImageView_2: View {
  var data: Data
  
  var body: some View {
    let colorSpace = CGColorSpaceCreateDeviceGray()
    let cgImageSource = CGImageSourceCreateWithData(data as CFData, nil)!
    let cgImage = CGImageSourceCreateImageAtIndex(cgImageSource, 0, nil)!
    let image = NSImage(cgImage: cgImage, size: NSSize(width: cgImage.width, height: cgImage.height))
    
    return Image(nsImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
  }
}

extension Data {
  func castToCPointer<T>() -> T {
    return self.withUnsafeBytes { $0.pointee }
  }
}


//struct ImageView_2_Previews: PreviewProvider {
//  static var previews: some View{
//    let image = NSImage(named: "siteLogo")!
//    let imageData = image.tiffRepresentation!
//    let bitmap = NSBitmapImageRep(data: imageData)!
//    let bytes = bitmap.bitmapData
//    let byteBuffer = bytes.bindMemory(to: UInt8.self, capacity: imageData.count)
//                let byteArray = Array(UnsafeBufferPointer(start: byteBuffer, count: imageData.count))
//    let byteArray = Array(UnsafeBufferPointer(start: byteBuffer, count: imageData.count))
//    ImageView_2(data: byteArray)
//  }
//}
