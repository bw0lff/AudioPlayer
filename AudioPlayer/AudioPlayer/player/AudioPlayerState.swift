//
//  AudioPlayerState.swift
//  AudioPlayer
//
//  Created by Kevin DELANNOY on 11/03/16.
//  Copyright © 2016 Kevin Delannoy. All rights reserved.
//

import Foundation

/**
 The possible errors an `AudioPlayer` can fail with.

 - MaximumRetryCountHit: The player hit the maximum retry count.
 - FoundationError:      The `AVPlayer` failed to play.
 */
public enum AudioPlayerError: ErrorType, Equatable {
    case MaximumRetryCountHit
    case FoundationError(NSError)
}

/**
 Return true if `lhs` is equal to `rhs`.

 - parameter lhs: The left value.
 - parameter rhs: The right value.

 - returns: true if `lhs` is equal to `rhs`.
 */
public func == (lhs: AudioPlayerError, rhs: AudioPlayerError) -> Bool {
    switch (lhs, rhs) {
    case (.MaximumRetryCountHit, .MaximumRetryCountHit):
        return true
    case (.FoundationError(let e1), .FoundationError(let e2)):
        return e1 == e2
    default:
        return false
    }
}

/**
 `AudioPlayerState` defines 4 state an `AudioPlayer` instance can be in.

 - `Buffering`:            The player is buffering data before playing them.
 - `Playing`:              The player is playing.
 - `Paused`:               The player is paused.
 - `Stopped`:              The player is stopped.
 - `WaitingForConnection`: The player is waiting for internet connection.
 - `Failed`:               An error occured. It contains AVPlayer's error if any.
*/
public enum AudioPlayerState: Equatable {
    case Buffering
    case Playing
    case Paused
    case Stopped
    case WaitingForConnection
    case Failed(AudioPlayerError)
}

/**
 Return true if `lhs` is equal to `rhs`.

 - parameter lhs: The left value.
 - parameter rhs: The right value.

 - returns: true if `lhs` is equal to `rhs`.
 */
public func == (lhs: AudioPlayerState, rhs: AudioPlayerState) -> Bool {
    switch (lhs, rhs) {
    case (.Buffering, .Buffering):
        return true
    case (.Playing, .Playing):
        return true
    case (.Paused, .Paused):
        return true
    case (.Stopped, .Stopped):
        return true
    case (.WaitingForConnection, .WaitingForConnection):
        return true
    case (.Failed(let e1), .Failed(let e2)):
        return e1 == e2
    default:
        return false
    }
}