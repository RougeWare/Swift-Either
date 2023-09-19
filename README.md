# Yet Another `Either` Type! 🥳

Did the world need another Swift `Either` type? No.
Are We suffering from Not-Invented-Here Syndrome? Maybe.
Did We still think this was a good idea? Definitely.

`Either` is a concept in many functional and strongly-typed languages which allows a value of **either** one type or another, to be stored in one field:

```swift
/// A response for the population query 
struct PopulationResponse {

    /// The list of people in the population
    ///
    /// - Note: In 1.x, this was a list of names as `String`s.
    ///         In 2.x and newer, this is a map of UUIDs to `Person` objects
    let people: Either<[String], [UUID: Person]>
}
```
