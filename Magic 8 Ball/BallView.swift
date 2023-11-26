import UIKit

class BallView: UIView {
    let titleQuestion: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ballImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ball1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let answerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ask", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    let containerView: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
//        verticalStack.spacing = 20
        verticalStack.distribution = .equalSpacing
        verticalStack.alignment = .center
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    
    var onAnswerButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        answerButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func answerButtonTapped() {
            onAnswerButtonTapped?()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        if let imageSize = ballImage.image?.size {
            let aspectRatio = imageSize.width / imageSize.height
            
            containerView.addArrangedSubview(titleQuestion)
            containerView.addArrangedSubview(ballImage)
            containerView.addArrangedSubview(answerButton)
            addSubview(containerView)
            
            NSLayoutConstraint.activate([
                // Позиционирование и размеры
                ballImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                // Установка ширины или высоты и соотношения сторон
                ballImage.widthAnchor.constraint(equalToConstant: 250),
                ballImage.heightAnchor.constraint(equalTo: ballImage.widthAnchor, multiplier: 1/aspectRatio),
//                titleQuestion.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 80),
                
                answerButton.widthAnchor.constraint(equalToConstant: 168),
                answerButton.heightAnchor.constraint(equalToConstant: 58),
                
                containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
            ])
        }
    }
}
