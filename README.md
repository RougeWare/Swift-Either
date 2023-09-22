[![Tested on GitHub Actions](https://github.com/RougeWare/swift-either/actions/workflows/swift.yml/badge.svg)](https://github.com/RougeWare/swift-either/actions/workflows/swift.yml) [![](https://www.codefactor.io/repository/github/rougeware/swift-either/badge)](https://www.codefactor.io/repository/github/rougeware/swift-either)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRougeWare%2FSwift-Either%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/RougeWare/Swift-Either) [![swift package](https://img.shields.io/badge/swift%20package-brightgreen.svg)](https://swift.org/package-manager) [![Supports macOS, iOS, tvOS, watchOS, Linux, & Windows](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRougeWare%2FSwift-Either%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/RougeWare/Swift-Either) 
[![](https://img.shields.io/github/release-date/rougeware/swift-either?label=latest%20release)](https://github.com/RougeWare/Swift-Either/releases/latest)



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

This implementation brings a few advantages:



## Automatic Conformance

This automatically conforms an instance of `Either` to various protocols if its `Left` and `Right` types also conform to them.

Currently, these are supported:

- **`Equatable` – Brings `==` and `!=`.** When `Left` and `Right` are unequal types, this considers `left` to never equal `right`. When those types are equal, this ignores the `left`ness and `right`ness positions

- **`Comparable` – Brings `<`, `<=`, `>=`, and `>`.** When the positions are unequal types, this considers `left` to never be less than nor greater than `right`. When those types are equal, this ignores the positions

- **`Hashable`** – Allows an instance of `Either` to transparently be given the same hash as whatever value it contains

- **`CustomStringConvertible` – Provides a `.description`** field with the same value as the `Either`'s contained value's `.description` field

- **`CustomDebugStringConvertible` – Provides a `.debugDescription`** field with the same value as the `Either`'s contained value's `.debugDescription` field

- **`Codable` – Allows `Either` instances to be encoded.** This results in a multi-value keyed container which only ever contains one key-value pair where the key is `"left"` or `"right"`, and the value is whatever the instance's value encodes to:
    ```json
    {
        "either": {
            "left": {
                "name": "Dax",
                "favoriteColor": 6765239
            }
        }
    }
    ```
    or:
    ```json
    {
        "either": {
            "right": 42
        }
    }
    ```



## Unwrapping

Obviously you gotta eventually get a value out of this, and it offers a few approaches:

- **`left`** – If the `Either` is a `.left`, then that value is returned, else `nil`
- **`right`** – If the `Either` is a `.right`, then that value is returned, else `nil`


When both `Left` and `Right` are the same type, then these are also available:

- **`value`** – The current value, disregarding whether that value is `.left` or `.right`
- **`*`** – Inspired by the semantics of dereferencing a pointer in C (and because Swift doesn't allow custom postfix `!`), place this before the `Either` instance for the same behavior as calling `.value:
    ```swift
    func name(_ user: Either<Person, Person>) -> String {
        return (*user).name
    }
    ```
- **`Value`** – Since both positions are the same type, this typealias allows you to reference that type without specifically using `Left` or `Right`:
    ```swift
    typealias LegacyOrMigratedUser = Either<User, User>
    
    func account(of user: LegacyOrMigratedUser) -> LegacyOrMigratedUser.Value.Account {
        (*user).account
    }
    ```



## Mapping

This provides various approaches for mapping an `Either`. Generally these consider it a collection of exactly one element, similarly to how `Optional` is treated as a collection of exactly 0 or 1 elements.


- **`map(left:right:)`** — Map both positions of this `either` to different values/types, regardless of its current value. Only one of these callbacks is called each time this function is called (the one mapping a value), but this allows you to reuse the same call many times to map both sides depending on which one is set.

- **`map(left:)`** – Map only the `Left` position of this `either` to a different value/type. The callback is only called when this `either` is a `.left` 

- **`map(right:)`** – Map only the `Right` position. Inverse of `map(left:)`



## Conversions

This allows you to convert instances of some types into `Either` and back:

- **`Optional`** – Any `Either` whose `Left` is `Void` can be turned into an `Optional<Right>`, and vice versa any `Optional` can be turned into an `Either<Void, Wrapped>`. Just pass one to the initializer of the other:
    ```swift
    let either = Either<Void, String>.right("I'm valued")
    let optional = Optional(either)
    print(optional!) // Prints `I'm valued`
    ```
    
    ```swift
    var optional: String? = nil
    var either = Either<Void, _>(optional)
    print(either) // Prints `left()`
    
    optional = "I'm not sorry"
    either = .init(optional)
    print(either) // Prints `right("I\'m not sorry")`
    ```

- **`Result`** – When `Either`'s `Rigth` is an `Error`, you can convert it to and from a `Result` similarly to the above `Optional` conversions:
    ```swift
    let either = Either<Data, Error>.left(Data(base64Encoded: "SG93ZHk=")!)
    let result = Result(either)
    print(result) // Prints `success(5 bytes)`
    ```
    
    ```swift
    var result = Result<Data, Error>(catching: { try Data(contentsOf: URL(string: "https://example.com")!) })
    var either = Either<_, Error>(result)
    print(either) // Prints `left(1256 bytes)`
    
    result = .init(catching: { try Data(contentsOf: URL(string: "https://fakeDomain.fakeTld")!) })
    either = .init(result)
    print(either) // Prints `right(Error Domain=NSCocoaErrorDomain Code=256 "The file couldn’t be opened." UserInfo={NSURL=https://fakeDomain.fakeTld})`
    ```
