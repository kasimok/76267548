//
//  ContentView.swift
//  imageViewExample
//
//  Created by 0x67 on 2023-05-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      // Convert and create a image from Color Image
      let image = NSImage(named: "siteLogo")!
      let imageData = image.tiffRepresentation!
      let bitmap = NSBitmapImageRep(data: imageData)!
      let bytes = bitmap.converting(to: .deviceGray, renderingIntent: .default)
      let pngData = bytes!.representation(using: .png, properties: [NSBitmapImageRep.PropertyKey.compressionFactor: 1.0])!
      // Now We have grey scaled pngData
      return ImageView_2(data: pngData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
