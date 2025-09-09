import time
import os
import pygame

pygame.init()

screen_width = 150
screen_height = 150
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Log Viewer")

black = (0, 0, 0)
white = (255, 255, 255)
green = (0, 255, 0)

font_small = pygame.font.Font(None, 18)
font_large = pygame.font.Font(None, 24)

def display_file_contents(file_path):
    try:
        running = True
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False

            screen.fill(black)

            try:
                with open(file_path, 'r', encoding='utf-8-sig') as f:
                    content = f.read()
                    lines = content.splitlines()

                    wrapped_lines = []
                    for line in lines:
                        words = line.split()
                        current_line = ""
                        for word in words:
                            if len(current_line) + len(word) + 1 <= 20:
                                current_line += (word + " ")
                            else:
                                wrapped_lines.append(current_line.strip())
                                current_line = word + " "
                        if current_line:
                            wrapped_lines.append(current_line.strip())

                    y_offset = 10
                    for line in wrapped_lines:

                        if line.startswith('F') and len(line) >= 2:
                            green_text = font_small.render(line[:2], True, green)
                            screen.blit(green_text, (10, y_offset))

                            white_text = font_small.render(line[2:], True, white)
                            screen.blit(white_text, (10 + font_small.size(line[:2])[0], y_offset))
                        else:
                            text_surface = font_large.render(line, True, white)
                            screen.blit(text_surface, (10, y_offset))

                        y_offset += 16

            except FileNotFoundError:
                error_line1 = font_large.render("Run the main script!", True, white)
                error_line2 = font_large.render("Not this one.", True, white)
                screen.blit(error_line1, (10, 10))
                screen.blit(error_line2, (10, 10 + font_large.get_height()))
            except Exception as e:
                error_text = font_large.render(f"Error: {e}", True, white)
                screen.blit(error_text, (10, 10))

            pygame.display.flip()
            time.sleep(1)

    except KeyboardInterrupt:
        print("\nStopped by user.")

    finally:
        pygame.quit()

if __name__ == "__main__":
    display = 'RobloxPID.log'
    display_file_contents(display)
