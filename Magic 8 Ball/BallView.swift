import UIKit

class BallView: UIView {
    let titleQuestion: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything"
        label.textColor = .white
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
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(titleQuestion)
        addSubview(ballImage)
        addSubview(answerButton)

        NSLayoutConstraint.activate([
            titleQuestion.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleQuestion.topAnchor.constraint(equalTo: topAnchor, constant: 140),

            ballImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            ballImage.topAnchor.constraint(equalTo: titleQuestion.bottomAnchor, constant: 20),
            ballImage.widthAnchor.constraint(equalToConstant: 300),
            ballImage.heightAnchor.constraint(equalToConstant: 300),

            answerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            answerButton.topAnchor.constraint(equalTo: ballImage.bottomAnchor, constant: 20),
            answerButton.widthAnchor.constraint(equalToConstant: 138),
            answerButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}
