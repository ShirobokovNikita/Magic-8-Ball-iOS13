import UIKit

class ViewController: UIViewController {
    private let ballModel = BallModel()
    private let ballView = BallView()

    override func loadView() {
        view = ballView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.backgroundColor = .blue
        ballView.answerButton.addTarget(self, action: #selector(didTapAnswer), for: .touchUpInside)
    }

    @objc func didTapAnswer() {
        let imageName = ballModel.getRandomImageName()
        ballView.ballImage.image = UIImage(named: imageName)
    }
}
