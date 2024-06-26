/// Copyright (c) 2024 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Combine

let gameLogic: Middleware<ThreeDucksState, ThreeDucksAction> = { state, action in
  switch action {
  case .flipCard:
    let flippedCards = state.cards.filter { $0.isFlipped }
    
    if flippedCards.count == state.cards.count {
      return Just(.winGame)
        .delay(for: 1, scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    let selectedCards = state.selectedCards
    
    if selectedCards.count == 2 {
      if selectedCards[0].animal == selectedCards[1].animal {
        return Just(.clearSelectedCards)
          .eraseToAnyPublisher()
      } else {
        return Just(.unflipSelectedCards)
          .delay(for: 1, scheduler: DispatchQueue.main)
          .eraseToAnyPublisher()
      }
    }
    
  default: break
  }
  
  return Empty().eraseToAnyPublisher()
}
