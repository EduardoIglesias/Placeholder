[![IDE](https://img.shields.io/badge/Xcode-11-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-13-green.svg)](https://developer.apple.com/ios/)

# Placeholder
Clean Swift, REST API services, Unit Tests and more...

This is a small Mobile APP in Swift 5 (iOS) that consumes a REST API service 
(the Fake API offered by https://jsonplaceholder.typicode.com/)

You can find REST Calls to two of the resources (Users and Todos).

In Todos resources you can see implementation of GET, POST, PATCH, PUT and DELETE call methods.

The approach to present data was using a tableview in a view controller with cells (GET).
with delete (DELETE) and check buttons (PATCH) inside of each.
If you click in the rest of the cell you can modify main text (PUT).
Finally i have implemented a floating button to create new Todos (POST).

I have used Clean Swift methodology to create necessary scenes (https://clean-swift.com/)

I have isolated communications layer in a common worker using generic types and Result struct from swift 5.
Then I have implemented different repositories into scenes workers.

I would improve it in the future using SwiftUI to rebuild user interfaces.

Especially concerning security and authentication, a good way is to implement session control 
sending session key to the server (token), creating the key in the login step (this is not necessary with this API).

All scenes are covered by Unit Tests (almost 70% of the app is covered).
