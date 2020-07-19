import Foundation

class CommandLiner {
    
    static func getFirstArgument() -> String? {
        switch CommandLine.arguments.count {
            
        case let count where count <= 2:
            return CommandLine.arguments[1]
        
        default:
            return nil
        }
    }
    
    static func printError(text: String) {
        var standardError = StdErrOutputStream()
        print(text, to: &standardError)
    }
    
    struct StdErrOutputStream: TextOutputStream {
        mutating func write(_ string: String) {
            fputs(string, stderr)
        }
    }
}
