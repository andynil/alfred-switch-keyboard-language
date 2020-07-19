// Heavily inspired by https://github.com/utatti/kawa/blob/master/kawa/InputSourceManager.swift
// of the Kawa project: https://github.com/utatti/kawa
import Carbon

class InputSource {
    
    static func setToFirstMatching(text: String) -> Bool {
        let inputSourceNSArray = TISCreateInputSourceList(nil, false).takeRetainedValue() as NSArray
        let inputSources = inputSourceNSArray as! [TISInputSource]
        
            let keyboardInputSources = inputSources
              .filter {
                $0.category == TISInputSource.Category.keyboardInputSource && $0.isSelectable
            }

        let matches = keyboardInputSources.filter {
            $0.name.range(of: text, options: .caseInsensitive) != nil
        }
        
        if (matches.isEmpty) {
            return false
        }

        TISSelectInputSource(matches[0])
        return true
    }
}
