//
//  NavigationRoutingView.swift
//  LMessenger
//
//  Created by  서재효 on 5/3/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @EnvironmentObject var container: DIContainer
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case let .chat(chatRoomId, myUserId, otherUserId):
            ChatView(viewModel: .init(container: container, chatRoomId: chatRoomId, myUserId: myUserId, otherUserId: otherUserId))
        case let .search(userId):
            SearchView(viewModel: .init(container: container, userId: userId))
        }
    }
}
