//  Copied from https://github.com/utatti/kawa/blob/master/kawa/TISInputSource%2BAdditions.swift
//  of the Kawa project: https://github.com/utatti/kawa

import Carbon

extension TISInputSource {
  enum Category {
    static var keyboardInputSource: String {
      return kTISCategoryKeyboardInputSource as String
    }
  }

  private func getProperty(_ key: CFString) -> AnyObject? {
    let cfType = TISGetInputSourceProperty(self, key)
    if (cfType != nil) {
      return Unmanaged<AnyObject>.fromOpaque(cfType!).takeUnretainedValue()
    } else {
      return nil
    }
  }

  var name: String {
    return getProperty(kTISPropertyLocalizedName) as! String
  }

  var category: String {
    return getProperty(kTISPropertyInputSourceCategory) as! String
  }

  var isSelectable: Bool {
    return getProperty(kTISPropertyInputSourceIsSelectCapable) as! Bool
  }

  var iconImageURL: URL? {
    return getProperty(kTISPropertyIconImageURL) as! URL?
  }
}
