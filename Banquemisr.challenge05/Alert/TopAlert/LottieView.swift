//
//  LottieView.swift
//  App
//
//  Created by Mohamed Aglan on 5/07/2024.
//

import UIKit
import Lottie

final class LottieView: UIView {
    
    private let animationView: LottieAnimationView = LottieAnimationView()
    
    @IBInspectable
    var animationName: String = "" {
        didSet {
            guard let file = Bundle.main.path(forResource: animationName, ofType: "json") else {return}
            animationView.animation = LottieAnimation.filepath(file)
            animationView.play()
        }
    }
    
    @IBInspectable
    var isInfinityLoop: Bool = true {
        didSet {
            animationView.loopMode = isInfinityLoop ? .loop : .playOnce
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
        configureInitialState()
        configureInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetUp()
        configureInitialState()
        configureInitialState()
    }
    
    
    private func xibSetUp() {
        animationView.frame = self.bounds
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    private func configureInitialState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animationView.backgroundBehavior = .pauseAndRestore
            self.animationView.loopMode = self.isInfinityLoop ? .loop : .playOnce
            self.animationView.play()
        }
    }
    
    //MARK: - Deinit -
    deinit {
        print("\(self.className) is deinit, No memory leak found")
    }
}

