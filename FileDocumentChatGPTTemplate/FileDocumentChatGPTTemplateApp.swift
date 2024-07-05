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
            ContentView(document: file.$document)
//                .onAppear {
//                    print("DocumentGroup content view appeared")
//                }
        }
    }
}
