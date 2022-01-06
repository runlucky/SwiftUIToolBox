//
//  PublisherExtensions.swift
//  SwiftUIToolBox
//
//  Created by Kakeru Fukuda on 2022/01/05.
//

import Combine

extension Publisher {
    public func receiveOutput(predicate: @escaping (Self.Output) -> Void) -> Publishers.ReceiveOutput<Self> {
        .init(upstream: self, predicate: predicate)
    }
}

extension Publishers {
    public struct ReceiveOutput<Upstream: Publisher>: Publisher {
        
        public typealias Output = Upstream.Output
        public typealias Failure = Upstream.Failure
        
        private let upstream: Upstream
        private let predicate: (Upstream.Output) -> Void
        
        public init(upstream: Upstream, predicate: @escaping (Upstream.Output) -> Void) {
            self.upstream = upstream
            self.predicate = predicate
        }

        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input {
            upstream
                .handleEvents(receiveOutput: predicate)
                .subscribe(subscriber)
        }
    }
}
