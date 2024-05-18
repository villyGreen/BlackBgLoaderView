//
//  BlackBGLoader.swift
//  BlackBGLoader
//
//  Created by vadim.vitkovskiy on 18.05.2024.
//

import UIKit

public class BlackBGLoader: UIView {

    private var blackBGView = UIView()
    private var loader = UIActivityIndicatorView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }

    public func show() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }

            blackBGView.alpha = 1
        } completion: { [weak self] _ in
            guard let self else { return }

            loader.startAnimating()
        }
    }

    public func hide() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }

            blackBGView.alpha = 0
        } completion: { [weak self] _ in
            guard let self else { return }

            loader.stopAnimating()
        }
    }

}

private extension BlackBGLoader {

    func config() {
        blackBGView = UIView()
        blackBGView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blackBGView)

        blackBGView.backgroundColor = .init(white: 0, alpha: 0.7)

        NSLayoutConstraint.activate([
            blackBGView.topAnchor.constraint(equalTo: topAnchor),
            blackBGView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackBGView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackBGView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false

        blackBGView.addSubview(loader)

        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
