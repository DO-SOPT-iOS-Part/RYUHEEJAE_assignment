//
//  DetailViewModel.swift
//  DetailFeature
//
//  Created by 류희재 on 2023/11/16.
//  Copyright © 2023 hellohidi. All rights reserved.
//

import Foundation

import Domain

import RxSwift
import RxCocoa

public final class DetailViewModel {
    internal var disposeBag = DisposeBag()
    
    public let detailUseCase: DetailUseCase
    
    public init(
        detailUseCase: DetailUseCase
    ) {
        self.detailUseCase = detailUseCase
    }
    
    struct Input {
        let viewWillAppearEvent: Observable<Void>
    }
    
    struct Output {
        var currentWeatherData = PublishRelay<CurrentWeatherModel>()
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        self.bindOutput(output: output, disposeBag: disposeBag)
        
        input.viewWillAppearEvent.subscribe(with: self, onNext: { owner, _ in
            owner.detailUseCase.getCurrentWeatherData()
        }).disposed(by: disposeBag)
        
        return output
    }
    
    
    private func bindOutput(output: Output, disposeBag: DisposeBag) {
        detailUseCase.currentWeatherData.subscribe(onNext: { weatherdata in
            output.currentWeatherData.accept(weatherdata)
        }).disposed(by: disposeBag)
    }
}

//extension DetailViewModel {
//    public func getCurrentWeatherData() -> CurrentWeatherModel {
//        return detailUseCase.currentWeatherData.value
//    }
//}



