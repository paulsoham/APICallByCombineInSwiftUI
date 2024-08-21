//
//  ContentView.swift
//  APICallByCombineSwiftUI
//
//  Created by sohamp on 21/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.error {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.todos) { todo in
                        VStack {
                              Text(todo.title)
                                  .frame(maxWidth: .infinity, alignment: .leading)
                              Text(todo.completed ? "Completed" : "Not Completed")
                                  .foregroundColor(todo.completed ? .green : .red)
                                  .frame(maxWidth: .infinity, alignment: .leading)
                          }
                    }
                }
            }
            .navigationTitle("Todos")
            .onAppear {
                viewModel.fetchTodos()
            }
        }
    }
}

