//
//  ADDetailsViewController.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import UIKit

class ADDetailsViewController: UIViewController {

    let ad: ADItemViewModel

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let creationDateLabel = UILabel()
    private let urgentView = UIView()
    private let urgentLabel = UILabel()
    private let adImageView = UIImageView()

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    init(ad: ADItemViewModel) {
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme(UIKitAppTheme.current(for: traitCollection.userInterfaceStyle))
    }

    private func setupUI() {
        view.backgroundColor = .white

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        adImageView.contentMode = .scaleToFill
        adImageView.clipsToBounds = true
        adImageView.layer.cornerRadius = 15
        adImageView.layer.shadowColor = UIColor.black.cgColor
        adImageView.layer.shadowRadius = 10
        adImageView.layer.masksToBounds = true
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        
        creationDateLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)

        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionLabel.numberOfLines = 0

        priceLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)

        urgentView.backgroundColor = .systemRed
        urgentView.layer.cornerRadius = 20
        urgentView.layer.masksToBounds = true
        urgentView.translatesAutoresizingMaskIntoConstraints = false

        urgentLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        urgentLabel.text = Localized.string("details_screen.urgent")
        urgentLabel.textAlignment = .center
        urgentLabel.numberOfLines = 1
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false

        urgentView.addSubview(urgentLabel)

        let stackView = UIStackView(arrangedSubviews: [
            adImageView,
            creationDateLabel,
            titleLabel,
            descriptionLabel,
            priceLabel,
            urgentView
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),

            urgentView.heightAnchor.constraint(equalToConstant: 40),
            urgentLabel.centerXAnchor.constraint(equalTo: urgentView.centerXAnchor),
            urgentLabel.centerYAnchor.constraint(equalTo: urgentView.centerYAnchor),
            
            adImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            adImageView.heightAnchor.constraint(greaterThanOrEqualTo: adImageView.widthAnchor, multiplier: 0.75)
        ])
    }

    private func updateUI() {
        titleLabel.text = ad.title
        descriptionLabel.text = ad.description
        priceLabel.text = ad.price
        creationDateLabel.text = ad.date

        urgentView.isHidden = !ad.isUrgent

        ad.loadImage { [weak self] image in
            if let image = image {
                self?.adImageView.image = image
            } else {
                self?.adImageView.removeFromSuperview()
            }
        }

        applyTheme(UIKitAppTheme.current(for: traitCollection.userInterfaceStyle))
    }

    private func applyTheme(_ theme: UIKitAppTheme) {
        view.backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColor
        descriptionLabel.textColor = theme.secondaryTextColor
        priceLabel.textColor = .green
        creationDateLabel.textColor = theme.secondaryTextColor
        urgentView.backgroundColor = .systemRed
        urgentLabel.textColor = .white
    }
}
