//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 류희재 on 2023/10/19.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLibs",
    targets: [.dynamicFramework],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.RxGesture,
        .SPM.Kingfisher,
        .SPM.RxCocoa,
        .SPM.RxDataSources,
        .SPM.RxRelay,
        .SPM.RxSwift,
        .SPM.ReactorKit
    ]
)
