//
//  ADDetailsViewController.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import UIKit

class ADDetailsViewController: UIViewController {
    
    let ad: ADItemViewModel
    
    private let adImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let creationDateLabel = UILabel()
    private let urgentView = UIView()
    private let urgentLabel = UILabel()
    private let gradient = CAGradientLayer()
    
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
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
    }
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupImageSection()
        setupDetailsSection()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupImageSection() {
        adImageView.contentMode = .scaleAspectFit
        adImageView.clipsToBounds = true
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(adImageView)
        contentView.addSubview(imageContainer)
        
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradient.locations = [0.5, 1.0]
        adImageView.layer.addSublayer(gradient)
        
        urgentView.backgroundColor = .systemRed
        urgentView.layer.cornerRadius = 16
        urgentView.translatesAutoresizingMaskIntoConstraints = false
        urgentView.isHidden = true
        
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel.text = Localized.string("details_screen.urgent")
        urgentLabel.textColor = .white
        urgentLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        urgentView.addSubview(urgentLabel)
        imageContainer.addSubview(urgentView)
        
        NSLayoutConstraint.activate([
            urgentLabel.centerXAnchor.constraint(equalTo: urgentView.centerXAnchor),
            urgentLabel.centerYAnchor.constraint(equalTo: urgentView.centerYAnchor),
            urgentView.heightAnchor.constraint(equalToConstant: 32),
            urgentView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            urgentView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 16),
            urgentView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -16)
        ])
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        creationDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        creationDateLabel.textColor = .white
        
        let infoStack = UIStackView(arrangedSubviews: [creationDateLabel, titleLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 6
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(infoStack)
        
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            adImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            adImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            adImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            
            infoStack.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 16),
            infoStack.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -16),
            infoStack.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -16),
            
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupDetailsSection() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        descriptionLabel.numberOfLines = 0
        
        priceLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        priceLabel.textColor = .systemGreen
        
        let detailsStack = UIStackView(arrangedSubviews: [descriptionLabel, priceLabel])
        detailsStack.axis = .vertical
        detailsStack.spacing = 16
        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(detailsStack)
        
        NSLayoutConstraint.activate([
            detailsStack.topAnchor.constraint(equalTo: adImageView.superview!.bottomAnchor, constant: 30),
            detailsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailsStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -30)
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
            }
        }
        
        applyTheme(UIKitAppTheme.current(for: traitCollection.userInterfaceStyle))
    }
    
    private func applyTheme(_ theme: UIKitAppTheme) {
        view.backgroundColor = theme.backgroundColor
        descriptionLabel.textColor = theme.textColor
    }
}
