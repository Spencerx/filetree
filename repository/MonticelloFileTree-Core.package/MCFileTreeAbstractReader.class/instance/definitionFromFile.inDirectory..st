utilities
definitionFromFile: directoryEntry inDirectory: aDirectory
  | defs reader |
  directoryEntry ifNil: [ ^ nil ].
  aDirectory
    readOnlyFileNamed: directoryEntry name
    do: [ :fileStream | 
      | methodDefinition |
      reader := MCStReader on: fileStream contents decodeFromUTF8 readStream.
      (defs := reader definitions) size <= 1
        ifFalse: [ self error: 'we should be writing exactly 1 definition per file' ] ].
  defs size = 0
    ifTrue: [ ^ nil ].
  ^ defs first