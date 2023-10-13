//
//  ContentView.swift
//  GdeckSwiftUI
//
//  Created by Rohit Sangwan on 13/10/23.
//

import GesturedeckiOS
import SwiftUI

struct ContentView: View {
    @StateObject var controller = ContentViewController()

    var body: some View {
        NavigationView {
            VStack {
                Divider().frame(height: 2)
                HStack(alignment: .center, spacing: 100) {
                    Button("Start", action: {
                        controller.onStartTap()
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)

                    Button("Stop", action: {
                        controller.onStopTap()
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)

                }.padding(10)

                VStack {
                    Text("GestureEvent: \(controller.gestureEvent)")
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                ).background(Color.gray.opacity(0.2))
            }
            .navigationTitle("Gesturedeck Example")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

@MainActor class ContentViewController: ObservableObject {
    @Published var gestureEvent = ""
    var gesturedeckMedia: GesturedeckMedia? = nil

    init() {
        gesturedeckMedia = GesturedeckMedia(
            tapAction: {
                self.gestureEvent = "tapAction"
            },
            swipeLeftAction: {
                self.gestureEvent = "swipeLeftAction"
            },
            swipeRightAction: {
                self.gestureEvent = "swipeRightAction"
            },
            panAction: { _ in
                self.gestureEvent = "panAction"
            },
            autoStart: true
        )
    }

    func onStartTap() {
        gesturedeckMedia?.start()
    }

    func onStopTap() {
        gesturedeckMedia?.stop()
    }
}

#Preview {
    ContentView()
}
