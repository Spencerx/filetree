as yet unclassified
writeRepositoryProperties
  self fileUtils
    writeStreamFor: '.filetree'
    in: self directory
    do: [ :fileStream | 
      | keyCount propertyCount |
      repositoryProperties
        ifNil: [ repositoryProperties := self defaultRepositoryProperties ].
      keyCount := repositoryProperties size.
      propertyCount := 0.
      fileStream nextPutAll: '{'.
      repositoryProperties
        keysAndValuesDo: [ :propertyName :propertyValue | 
          propertyCount := propertyCount + 1.
          fileStream
            nextPut: $";
            nextPutAll: propertyName asString;
            nextPutAll: '" : "';
            nextPutAll: propertyValue asString;
            nextPut: $";
            yourself.
          propertyCount < keyCount
            ifTrue: [ 
              fileStream
                nextPutAll: ',';
                lf ] ].
      fileStream nextPutAll: ' }' ]
