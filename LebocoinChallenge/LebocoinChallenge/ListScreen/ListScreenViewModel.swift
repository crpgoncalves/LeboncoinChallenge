//
//  ListScreenViewModel.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import SwiftUI


class ListScreenViewModel: ObservableObject {
    @Published var categories = [LCCategory]()
    
    private let getCategoryService: GetCategoriesServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(getCategoryService: GetCategoriesServiceProtocol = GetCategoriesService()) {
        self.getCategoryService = getCategoryService
    }
    
    func fetchCategories() {
        getCategoryService.getCategories()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.categories = response
                print(response)
            })
            .store(in: &cancellables)

    }
}
