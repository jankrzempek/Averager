# Averager

:package: **Swift Package** :package:

The aim of the Averager, is to provide the users with all the nedded methods for executing different averaging methods.

Every method, takes the array of data as an argument and chunk number.
Chunk number tells Averager if the data should be splitted into smaller arrays and considered independently or not.

Averager methods:

 - Arythmetic average
 - Median average
 - Geometric average

```
// Example of arithmetic average
        
averager.arithmeticAverage(using: [1, 2, 3, 4, 5], chunkedEvery: 2)

// Chunk number == 0
    // data transformed: [1, 2, 3, 4, 5]
    // result: [3]

// Chunk number == 1
    // data transformed: [[1], [2], [3], [4], [5]]
    // result: [[1], [2], [3], [4], [5]]

// Chunk number == 2
    // data transformed: [[1, 2], [3, 4], [5]]
    // result: [[1.5], [3.5], [5]]

// Chunk number == 5
    // data transformed: [[1, 2, 3, 4, 5]]
    // result: [[3]]

// Chunk number == 6 - NOT POSSIBLE
    // data transformed: nil
    // result: nil
```

Have a great time using this Swift Package!
