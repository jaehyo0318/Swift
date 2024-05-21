//
//  SearchViewModel.swift
//  LMessenger
//
//  Created by  서재효 on 5/7/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    enum Action {
        case requestQuery(String)
        case clearSearchResult
        case clearSearchText
    }
    
    @Published var searchText: String = ""
    @Published var searchResults: [User] = []
    @Published var sholdBecomeFirstResponder: Bool = false
    
    private let userId: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
            
        bind()
    }
    
    func bind() {
        $searchText
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.send(action: .clearSearchResult)
                } else {
                    self?.send(action: .requestQuery(text))
                }
            }.store(in: &subscriptions)
    }
    
    func send(action: Action) {
        switch action {
        case let .requestQuery(query):
            container.services.userService.filterUsers(with: query, userId: userId)
                .sink { copletion in
                } receiveValue: { [weak self] users in
                    self?.searchResults = users
                }.store(in: &subscriptions)
            
        case .clearSearchResult:
            searchResults = []
            
        case .clearSearchText:
            searchText = ""
            sholdBecomeFirstResponder = false
            searchResults = []
        }
    }
        
}
