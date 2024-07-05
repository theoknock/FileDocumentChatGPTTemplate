import SwiftUI
import UniformTypeIdentifiers

struct TextFile: FileDocument {
    static var readableContentTypes: [UTType] { [.plainText] }
    
     var text: String
    
    init(initialText: String = "") {
        self.text = initialText
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self.text = String(decoding: data, as: UTF8.self)
        } else {
            self.text = ""
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(self.text.utf8)
        
        return .init(regularFileWithContents: data)
    }
}

struct DocumentLaunchView: View {
    @Binding var document: TextFile
    
    var body: some View {
        VStack {
            Button(action: {
                // Button action goes here
            }) {
                Text("Do Something")
            }
            ContentView(document: $document)
        }
    }
}

struct ContentView: View {
    @Binding var document: TextFile
    
    var body: some View {
        TextEditor(text: $document.text)
            .padding()
//            .onAppear {
//                print("ContentView appeared with text: \(document.text)")
//            }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(document: .constant(TextFile(initialText: "Preview Text")))
//    }
//}
