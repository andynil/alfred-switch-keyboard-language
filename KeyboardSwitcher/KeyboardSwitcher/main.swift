import Foundation

guard let nameOfInputSource = CommandLiner.getFirstArgument() else {
    CommandLiner.printError(text: "Please provide a string argument (partially, case-insensitive) matching the name of the input source you want to switch to.")
    exit(EXIT_FAILURE)
}

if (InputSource.setToFirstMatching(text: nameOfInputSource)) {
    exit(EXIT_SUCCESS)
} else {
    CommandLiner.printError(text: "Did not find an input source matching \(nameOfInputSource)")
    exit(EXIT_FAILURE)
}



