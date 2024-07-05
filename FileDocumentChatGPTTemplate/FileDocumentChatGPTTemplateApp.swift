//
//  FileDocumentChatGPTTemplateApp.swift
//  FileDocumentChatGPTTemplate
//
//  Created by Xcode Developer on 7/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

@main
struct MyApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            DocumentLaunchView(document: file.$document)
//            ContentView(document: file.$document)
            //                .onAppear {
            //                    print("DocumentGroup content view appeared")
            //                }
        }
        DocumentGroupLaunchScene {
            NewDocumentButton("Start Dictation")
        }
    }
}
