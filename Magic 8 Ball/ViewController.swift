import UIKit

class ViewController: UIViewController {
    private let ballModel = BallModel()
    private let ballView = BallView()
    
    override func loadView() {
        view = ballView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.backgroundColor = #colorLiteral(red: 0.382902354, green: 0.8057182431, blue: 0.995292604, alpha: 1)
        ballView.onAnswerButtonTapped = { [weak self] in
            self?.didTapAnswer()
        }
    }
    
    private func didTapAnswer() {
        shakeAnimation(for: ballView.ballImage) {
            guard let newImage = self.ballModel.getRandomImage() else { return }
            self.ballView.ballImage.image = newImage
        }
    }
    
    private func shakeAnimation(for view: UIView, completion: @escaping () -> Void) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [-0.03, 0.03, -0.03]
        animation.duration = 0.2
        animation.repeatCount = 5
        animation.isAdditive = true
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.delegate = self
        view.layer.add(animation, forKey: "shake")
        CATransaction.setCompletionBlock(completion)
        view.layer.add(animation, forKey: nil)
        CATransaction.commit()
    }
}

extension ViewController: CAAnimationDelegate {}
