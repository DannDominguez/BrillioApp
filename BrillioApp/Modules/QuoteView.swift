//
//  QuoteView.swift
//  BrillioApp
//
//  Created by Daniela Ciciliano on 16/04/24.
//


import SwiftUI

struct QuotesView: View {
    @StateObject var viewModel = QuotesViewModel()
    
    var body: some View {
        VStack {
            if let quote = viewModel.quotesDetail {
                VStack(alignment: .leading) {
                    
                    Text("\(quote.content)")
                        .font(.headline.italic())
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Text("Author: \(quote.author)")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Button(action: {
                    viewModel.getDataQuotes()
                    
                }) {
                    Image(systemName: "arrow.counterclockwise")
                        .padding(20)
                        .foregroundColor(.blue)
                        
                }

            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Quote of the Day")
        .onAppear {
            viewModel.getDataQuotes()
        }
        
    }
}
