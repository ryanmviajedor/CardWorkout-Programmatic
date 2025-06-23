//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Ryan Viajedor on 6/23/25.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let restartButton   = CWButton(color: .systemGreen, title: "Restart", systemImageName: "arrow.clockwise.circle")
    let rulesButton     = CWButton(color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    
    var cards: [UIImage] = CardDeck.allCards
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func restartTimer() {
        timer.invalidate()
        startTimer()
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    func configureUI () {
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configurerulesButton()
    }
    
    
    func configureCardImageView () {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    
    func configureStopButton () {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func configureRestartButton () {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
        ])
    }
    
    
    func configurerulesButton () {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
        ])
    }
    
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }

}
