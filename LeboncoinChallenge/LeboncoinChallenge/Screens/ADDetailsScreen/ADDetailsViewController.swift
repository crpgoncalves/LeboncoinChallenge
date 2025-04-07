//
//  ADDetailsViewController.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import UIKit

final class ADDetailsViewController: UIViewController {

    let ad: ADItemViewModel

    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    private let headerView = ADImageHeaderView()
    private let infoView = ADDetailsInfoView()

    init(ad: ADItemViewModel) {
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        applyTheme(UIKitAppTheme.current(for: traitCollection.userInterfaceStyle))
        headerView.configure(with: ad)
        infoView.configure(with: ad)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme(UIKitAppTheme.current(for: traitCollection.userInterfaceStyle))
    }

    private func setupLayout() {
        view.backgroundColor = .systemBackground

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.axis = .vertical
        contentView.spacing = 30
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])

        contentView.addArrangedSubview(headerView)
        contentView.addArrangedSubview(infoView)
    }

    private func applyTheme(_ theme: UIKitAppTheme) {
        view.backgroundColor = theme.backgroundColor
        infoView.applyTheme(theme)
    }
}
