//
//  ADImageHeaderView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import UIKit

final class ADImageHeaderView: UIView {

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let urgentView = UIView()
    private let urgentLabel = UILabel()
    private let gradient = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradient.locations = [0.5, 1.0]
        imageView.layer.addSublayer(gradient)

        urgentView.backgroundColor = .systemRed
        urgentView.layer.cornerRadius = 16
        urgentView.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel.font = .boldSystemFont(ofSize: 14)
        urgentLabel.textColor = .white
        urgentView.addSubview(urgentLabel)
        addSubview(urgentView)

        NSLayoutConstraint.activate([
            urgentLabel.centerXAnchor.constraint(equalTo: urgentView.centerXAnchor),
            urgentLabel.centerYAnchor.constraint(equalTo: urgentView.centerYAnchor),
            urgentView.heightAnchor.constraint(equalToConstant: 32),
            urgentView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            urgentView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            urgentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0

        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .white

        let stack = UIStackView(arrangedSubviews: [dateLabel, titleLabel])
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
        imageView.layer.cornerRadius = 12
    }

    func configure(with viewModel: ADItemViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        urgentView.isHidden = !viewModel.isUrgent
        urgentLabel.text = Localized.string("details_screen.urgent")
        viewModel.loadImage { [weak self] image in
            self?.imageView.image = image
        }
    }
}
