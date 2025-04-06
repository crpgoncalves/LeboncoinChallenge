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

        adImageView.contentMode = .scaleAspectFill
        adImageView.clipsToBounds = true
        adImageView.layer.cornerRadius = 10
        adImageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black

        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .darkGray

        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.textColor = .systemGreen

        creationDateLabel.font = UIFont.systemFont(ofSize: 14)
        creationDateLabel.textColor = .lightGray

        urgentView.backgroundColor = .red
        urgentView.layer.cornerRadius = 8
        urgentView.layer.masksToBounds = true
        urgentView.translatesAutoresizingMaskIntoConstraints = false

        urgentLabel.font = UIFont.boldSystemFont(ofSize: 16)
        urgentLabel.textColor = .white
        urgentLabel.text = Localized.string("details_screen.urgent")
        urgentLabel.textAlignment = .center
        urgentLabel.numberOfLines = 0
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false

        urgentView.addSubview(urgentLabel)

        let stackView = UIStackView(arrangedSubviews: [
            adImageView,
            titleLabel,
            descriptionLabel,
            priceLabel,
            creationDateLabel,
            urgentView
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            adImageView.heightAnchor.constraint(equalToConstant: 200),
            urgentView.heightAnchor.constraint(equalToConstant: 40),

            urgentLabel.topAnchor.constraint(equalTo: urgentView.topAnchor, constant: 8),
            urgentLabel.bottomAnchor.constraint(equalTo: urgentView.bottomAnchor, constant: -8),
            urgentLabel.leadingAnchor.constraint(equalTo: urgentView.leadingAnchor, constant: 8),
            urgentLabel.trailingAnchor.constraint(equalTo: urgentView.trailingAnchor, constant: -8)
        ])
    }

    private func updateUI() {
        titleLabel.text = ad.title
        descriptionLabel.text = ad.description
        priceLabel.text = ad.price
        creationDateLabel.text = ad.date

        urgentView.isHidden = !ad.isUrgent

        if let url = URL(string: ad.image) {
            loadImage(from: url)
        }
    }

    private func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let data = data, let image = UIImage(data: data) else {
                    self?.adImageView.removeFromSuperview()
                    return
                }
                self?.adImageView.image = image
            }
        }
        task.resume()
    }
}
