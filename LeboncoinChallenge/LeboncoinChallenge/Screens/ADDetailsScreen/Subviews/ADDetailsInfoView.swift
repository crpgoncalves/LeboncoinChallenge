//
//  ADDetailsInfoView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import UIKit

final class ADDetailsInfoView: UIView {

    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0

        priceLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        priceLabel.textColor = .systemGreen

        let stack = UIStackView(arrangedSubviews: [descriptionLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(with viewModel: ADItemViewModel) {
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price
    }

    func applyTheme(_ theme: UIKitAppTheme) {
        descriptionLabel.textColor = theme.textColor
    }
}
