import UIKit

class PongViewController: UIViewController {
    var ball = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    var playerPaddle = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 100))
    var computerPaddle = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 100))
    var ballXVelocity = 1
    var ballYVelocity = 1
    var playerScore = 0
    var computerScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the ball
        ball.backgroundColor = UIColor.white
        ball.center = view.center
        view.addSubview(ball)
        
        // Configure the player paddle
        playerPaddle.backgroundColor = UIColor.white
        playerPaddle.center = CGPoint(x: playerPaddle.frame.width/2 + 10, y: view.frame.height/2)
        view.addSubview(playerPaddle)
        
        // Configure the computer paddle
        computerPaddle.backgroundColor = UIColor.white
        computerPaddle.center = CGPoint(x: view.frame.width - computerPaddle.frame.width/2 - 10, y: view.frame.height/2)
        view.addSubview(computerPaddle)
        
        // Start the game
        startGame()
    }
    
    func startGame() {
        // Move the ball in a random direction
        ballXVelocity = Int.random(in: -1...1)
        ballYVelocity = Int.random(in: -1...1)
        
        // Start the game timer
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    
    @objc func gameLoop() {
        // Update the ball position
        ball.center.x += CGFloat(ballXVelocity)
        ball.center.y += CGFloat(ballYVelocity)
        
        // Check if the ball has hit a boundary
        if ball.frame.origin.x < 0 {
            // The ball has hit the left boundary, so award a point to the computer
            computerScore += 1
            resetBall()
        } else if ball.frame.origin.x + ball.frame.width > view.frame.width {
            // The ball has hit the right boundary, so award a point to the player
            playerScore += 1
            resetBall()
        }
        
        if ball.frame.origin.y < 0 || ball.frame.origin.y + ball.frame.height > view.frame.height {
            // The ball has hit the top or bottom boundary, so reverse its y velocity
            ballYVelocity *= -1
        }
        
        // Check if the ball has hit a paddle
        if ball.frame.intersects(playerPaddle.frame) || ball.frame.intersect
