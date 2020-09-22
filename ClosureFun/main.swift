//
//  main.swift
//  ClosureFun
//
//  Created by Gina Sprint on 9/22/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import Foundation

// MARK: - Functions
// a function is a first class citizen in swift
// this means you can use a function anywhere you can use a value
// just like values, functions have types
// examples
// () -> Void           the type of all functions that accept no arguments and don't return a value
// the type is based on the function's signature
func print3() {
    print("3")
}
// () -> Int
// (Double) -> (Double)
// ([String], Int) -> (Double)
// (Int, Double, Float) -> ((Double, Int)) // this is a tuple

// local function: a function that is defined inside the body of another function
// reasons why you might do this:
// - defining a helper function that is only used in this function
// - to keep the code that is highly cohesive near each other readibility
// - function is only going to be called one time (or in one spot)
// - function is going to be passed into another function as an argument

// MARK: - Closures
// a function that has no name is called an anonymous function (AKA CLOSURE)
// closure: a piece of functionality that you can pass around in your code to be executed at a later time
// note: closures "capture" their external references....

// example!!

func sayHello() {
    print("hello")
}

// the type of sayHello() is () -> Void
// so lets define another function that can execute any () -> Void type functions
func executeVoidFunction(f: () -> Void) {
    // execute f
    f()
}

// call executeVoidFunction(f:) passing in sayHello
executeVoidFunction(f: sayHello)
// call executeVoidFunction(f:) passing in a closure
executeVoidFunction(f: { () -> Void in
    // closures start with { and end with }
    // on the first line we specify our parameter list, our return type, and
    // the word "in"  to separate the "header" from the body
    print("goodbye")
})

// swift has a lot "syntactic sugar" or "shorthand" for closures
executeVoidFunction {
    print("good day")
}

// another example!
// a function that accepts and calls a function of type (Int) -> Int
func transformRandomInteger(f: (Int) -> Int) {
    let randNum = Int.random(in: 1...10)
    let transformedNum = f(randNum)
    print(randNum, transformedNum)
}

// lets call transformRandomInteger() passing in a closure that doubles a number
transformRandomInteger(f: { (value) -> Int in
    return value * 2
})

// task: call transformRandomInteger() passing in a closure that squares a number
transformRandomInteger { $0 * $0 }

// more on shorthand
// if the closure has only one line, you can omit the return word, swift will return whatever that one line evaluates to
// swift can infer the return type
// we can omit the parameter list and use general placeholders instead
// $0 can be used to refer to the first parameter
// $1 for the second...
// trailing closure: a closure that is the last argument to a function call
// a trailing closure can be outside of the ()
// if the closure is the only argument, you don't need the ()

// closures are everywhere
// map, reduce, filter often written using closures
// some examples in iOS
// alertcontrollers use closures to execute later
// timers use closures to execute periodically
// LOTS MORE!!! they aren't going away
