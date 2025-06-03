# Conceptual Outline for pong_game.py
import tkinter as tk
import time

# --- Constants ---
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
PADDLE_WIDTH = 20
PADDLE_HEIGHT = 100
BALL_RADIUS = 10
PADDLE_SPEED = 30
BALL_SPEED_X_INITIAL = 5
BALL_SPEED_Y_INITIAL = 5
WINNING_SCORE = 7

# Colors
BG_COLOR = '#000000'       # Black
PADDLE_COLOR = '#FFFFFF'   # White
BALL_COLOR = '#FFFF00'     # Yellow
TEXT_COLOR = '#FFFFFF'     # White

# --- Game Logic Class ---
class PongGameLogic:
    def __init__(self):
        self.ball_pos = [SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2]
        self.ball_vel = [BALL_SPEED_X_INITIAL, BALL_SPEED_Y_INITIAL]
        self.paddle1_pos_y = SCREEN_HEIGHT / 2 - PADDLE_HEIGHT / 2
        self.paddle2_pos_y = SCREEN_HEIGHT / 2 - PADDLE_HEIGHT / 2
        self.score1 = 0
        self.score2 = 0
        self.game_over_flag = False

    def update_ball(self):
        if self.game_over_flag:
            return

        self.ball_pos[0] += self.ball_vel[0]
        self.ball_pos[1] += self.ball_vel[1]

        # Wall collision (top/bottom)
        if self.ball_pos[1] - BALL_RADIUS <= 0 or \
           self.ball_pos[1] + BALL_RADIUS >= SCREEN_HEIGHT:
            self.ball_vel[1] *= -1

        # Paddle collision
        # Paddle 1 (left)
        if self.ball_pos[0] - BALL_RADIUS <= PADDLE_WIDTH and \
           self.paddle1_pos_y < self.ball_pos[1] < self.paddle1_pos_y + PADDLE_HEIGHT:
            self.ball_vel[0] *= -1
            # Optional: Add slight angle change based on where it hits paddle
        
        # Paddle 2 (right)
        if self.ball_pos[0] + BALL_RADIUS >= SCREEN_WIDTH - PADDLE_WIDTH and \
           self.paddle2_pos_y < self.ball_pos[1] < self.paddle2_pos_y + PADDLE_HEIGHT:
            self.ball_vel[0] *= -1
            # Optional: Add slight angle change

        # Scoring
        if self.ball_pos[0] - BALL_RADIUS < 0: # Ball passed paddle 1
            self.score2 += 1
            self.reset_ball()
        elif self.ball_pos[0] + BALL_RADIUS > SCREEN_WIDTH: # Ball passed paddle 2
            self.score1 += 1
            self.reset_ball()
        
        self.check_game_over()

    def reset_ball(self):
        self.ball_pos = [SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2]
        # Alternate starting direction
        self.ball_vel[0] *= -1 
        # self.ball_vel[1] can be randomized or kept same

    def move_paddle(self, paddle, direction):
        if paddle == 1:
            self.paddle1_pos_y += PADDLE_SPEED * direction
            self.paddle1_pos_y = max(0, min(self.paddle1_pos_y, SCREEN_HEIGHT - PADDLE_HEIGHT))
        elif paddle == 2:
            self.paddle2_pos_y += PADDLE_SPEED * direction
            self.paddle2_pos_y = max(0, min(self.paddle2_pos_y, SCREEN_HEIGHT - PADDLE_HEIGHT))

    def check_game_over(self):
        if self.score1 >= WINNING_SCORE or self.score2 >= WINNING_SCORE:
            self.game_over_flag = True
            return True
        return False

    def reset_game_state(self):
        self.score1 = 0
        self.score2 = 0
        self.game_over_flag = False
        self.reset_ball()
        # Reset paddle positions if desired
        self.paddle1_pos_y = SCREEN_HEIGHT / 2 - PADDLE_HEIGHT / 2
        self.paddle2_pos_y = SCREEN_HEIGHT / 2 - PADDLE_HEIGHT / 2


# --- GUI Class ---
class PongGameGUI:
    def __init__(self, master):
        self.master = master
        master.title("Retro Pong Challenge")
        master.geometry(f"{SCREEN_WIDTH}x{SCREEN_HEIGHT+50}") # Extra space for scores
        master.configure(bg=BG_COLOR)
        master.resizable(False, False)

        self.game_logic = PongGameLogic()

        self.canvas = tk.Canvas(master, width=SCREEN_WIDTH, height=SCREEN_HEIGHT, bg=BG_COLOR, highlightthickness=0)
        self.canvas.pack()

        self.score_label = tk.Label(master, text=self.get_score_text(), font=("Consolas", 24, "bold"), bg=BG_COLOR, fg=TEXT_COLOR)
        self.score_label.pack(pady=10)
        
        # Conceptual: Add a play_again_button (initially disabled or hidden)

        self.setup_initial_elements()
        self.bind_keys()
        self.game_loop()

    def get_score_text(self):
        return f"Player 1: {self.game_logic.score1}  |  Player 2: {self.game_logic.score2}"

    def setup_initial_elements(self):
        # Paddles
        self.paddle1 = self.canvas.create_rectangle(0, self.game_logic.paddle1_pos_y,
                                                  PADDLE_WIDTH, self.game_logic.paddle1_pos_y + PADDLE_HEIGHT,
                                                  fill=PADDLE_COLOR)
        self.paddle2 = self.canvas.create_rectangle(SCREEN_WIDTH - PADDLE_WIDTH, self.game_logic.paddle2_pos_y,
                                                  SCREEN_WIDTH, self.game_logic.paddle2_pos_y + PADDLE_HEIGHT,
                                                  fill=PADDLE_COLOR)
        # Ball
        self.ball = self.canvas.create_oval(self.game_logic.ball_pos[0] - BALL_RADIUS, 
                                            self.game_logic.ball_pos[1] - BALL_RADIUS,
                                            self.game_logic.ball_pos[0] + BALL_RADIUS, 
                                            self.game_logic.ball_pos[1] + BALL_RADIUS,
                                            fill=BALL_COLOR)
        # Center line (optional)
        self.canvas.create_line(SCREEN_WIDTH / 2, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT, fill=PADDLE_COLOR, dash=(4, 2))


    def bind_keys(self):
        # Player 1 ('w' for up, 's' for down)
        self.master.bind('w', lambda event: self.game_logic.move_paddle(1, -1))
        self.master.bind('s', lambda event: self.game_logic.move_paddle(1, 1))
        # Player 2 (Up arrow for up, Down arrow for down)
        self.master.bind('<Up>', lambda event: self.game_logic.move_paddle(2, -1))
        self.master.bind('<Down>', lambda event: self.game_logic.move_paddle(2, 1))
        # Conceptual: Bind key for play_again (e.g. 'r' or spacebar)

    def update_display(self):
        # Move paddles
        self.canvas.coords(self.paddle1, 0, self.game_logic.paddle1_pos_y,
                           PADDLE_WIDTH, self.game_logic.paddle1_pos_y + PADDLE_HEIGHT)
        self.canvas.coords(self.paddle2, SCREEN_WIDTH - PADDLE_WIDTH, self.game_logic.paddle2_pos_y,
                           SCREEN_WIDTH, self.game_logic.paddle2_pos_y + PADDLE_HEIGHT)
        # Move ball
        self.canvas.coords(self.ball, self.game_logic.ball_pos[0] - BALL_RADIUS, 
                                      self.game_logic.ball_pos[1] - BALL_RADIUS,
                                      self.game_logic.ball_pos[0] + BALL_RADIUS, 
                                      self.game_logic.ball_pos[1] + BALL_RADIUS)
        # Update score
        self.score_label.config(text=self.get_score_text())

    def game_loop(self):
        if not self.game_logic.game_over_flag:
            self.game_logic.update_ball()
            self.update_display()
            self.master.after(30, self.game_loop) # Approx 33 FPS
        else:
            self.display_game_over()
            # Conceptual: Enable play_again_button here

    def display_game_over(self):
        winner_text = "Game Over! "
        if self.game_logic.score1 >= WINNING_SCORE:
            winner_text += "Player 1 Wins!"
        else:
            winner_text += "Player 2 Wins!"
        self.canvas.create_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, text=winner_text,
                                font=("Consolas", 40, "bold"), fill=BALL_COLOR)
        # Conceptual: Add "Press R to Play Again" text

    # Conceptual: def play_again(self):
    #   self.game_logic.reset_game_state()
    #   self.canvas.delete("all") # Clear game over text
    #   self.setup_initial_elements()
    #   self.game_loop()
    #   Disable play_again_button

if __name__ == "__main__":
    root = tk.Tk()
    game_gui = PongGameGUI(root)
    root.mainloop()