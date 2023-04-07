import Foundation

class Database : Codable {
    
    private let fileURL: URL

    init(fileName: String) {
        let directory = FileManager.default.currentDirectoryPath
        self.fileURL = URL(fileURLWithPath: directory).appendingPathComponent(fileName)

        if !FileManager.default.fileExists(atPath: fileURL.path) {
            FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        }
    }
    
    func readTXT() -> [Int]? {
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            let array = content.components(separatedBy: "\n").compactMap{ Int($0) }
            return array
        } catch {
            print("Error reading file")
            return nil
        }
    }

    func writeTXT(_ value: Int) {
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            let textToWrite = "\n" + String(value)
            fileHandle.seekToEndOfFile()
            fileHandle.write(textToWrite.data(using: .utf8)!)
            fileHandle.closeFile()
        } catch {
            print("Error writing file: \(error)")
        }
    }
    
    func reWriteTXT<C: Sequence>(_ collection: C) where C.Element == Int {
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            fileHandle.truncateFile(atOffset: 0)
            fileHandle.closeFile()
        } catch {
            print("Error truncating file: \(error)")
        }
        
        for value in collection {
            self.writeTXT(value)
        }
    }
    
    func reWriteReverseTXT<C: Sequence>(_ collection: C) where C.Element == Int {
        let tempStack = Stack<Int>()
        for value in collection {
            tempStack.push(value)
        }
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            fileHandle.truncateFile(atOffset: 0)
            fileHandle.closeFile()
        } catch {
            print("Error in Rewriting File")
        }
        
        for value in tempStack {
            self.writeTXT(value)
        }
    }

    
//    func reWriteReverseTXT(_ stack: Stack<Int>) {
//        let tempStack = Stack<Int>()
//        for value in stack {
//            tempStack.push(value)
//        }
//        do {
//            let fileHandle = try FileHandle(forWritingTo: fileURL)
//            fileHandle.truncateFile(atOffset: 0)
//            fileHandle.closeFile()
//        } catch {
//            print("Error truncating file: \(error)")
//        }
//
//        for value in tempStack {
//            self.writeTXT(value)
//        }
//    }

}
