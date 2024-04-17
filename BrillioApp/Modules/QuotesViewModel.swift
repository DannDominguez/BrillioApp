//
//  QuotesViewModel.swift
//  BrillioApp
//
//  Created by Daniela Ciciliano on 16/04/24.
//

import Foundation

class QuotesViewModel: ObservableObject {
    
    @Published var quotesDetail: QuoteModel?
    @Published var error: Error?
    
    //Refrescar la cita
    @Published var isLoading: Bool = false
    

    let ApiClient = APIClient()
    
    func getDataQuotes() {
        //Carga la nueva cita mandando a llamar a la var
        isLoading = true
        ApiClient.getQuotes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let quotes):
                    self?.quotesDetail = quotes
                    print("results \(String(describing: self?.quotesDetail))")
                case .failure(let error):
                    self?.error = error
                    print("Error fetching post: \(error)")
                    
                }
                
            }
        }
        
    }
}
