import pygame
import numpy as np
import math
import random

class Ball:
    def __init__(self, position, velocity):
        self.pos = np.array(position, dtype=np.float64)  # Vị trí bóng dạng vector
        self.v = np.array(velocity, dtype=np.float64)    # Vận tốc bóng dạng vector
        self.color = (random.randint(0, 255),random.randint(0, 255),random.randint(0, 255))  # Màu ngẫu nhiên RGB
        self.is_in = True   # Trạng thái bóng (trong/ngoài cung)

# Hàm vẽ cung tròn đen
def draw_arc(window, center, radius, start_angle, end_angle):
    # Tính 2 điểm đầu cuối của cung
    p1 = center + (radius+1000) * np.array([math.cos(start_angle),math.sin(start_angle)])
    p2 = center + (radius+1000) * np.array([math.cos(end_angle),math.sin(end_angle)])
    # Vẽ tam giác đen từ tâm đến 2 điểm này
    pygame.draw.polygon(window,BLACK, [center,p1,p2], 0)


def is_ball_in_arc(ball_pos, CIRCLE_CENTER, start_angle, end_angle):
    # Tính góc của bóng so với tâm
    dx = ball_pos[0] - CIRCLE_CENTER[0]
    dy = ball_pos[1] - CIRCLE_CENTER[1]
    ball_angle = math.atan2(dy, dx)

    # Chuẩn hóa các góc về khoảng [0, 2π]
    end_angle = end_angle % (2 * math.pi)
    start_angle = start_angle % (2 * math.pi)

    # Xử lý trường hợp cung đi qua góc 0
    if start_angle > end_angle:
        end_angle += 2 * math.pi

    # Kiểm tra góc của bóng có nằm trong khoảng góc của cung
    if start_angle <= ball_angle <= end_angle or (start_angle <= ball_angle + 2 * math.pi <= end_angle):
        return True

# Phần chính của game loop
while running:
    # Xử lý khi bóng ra khỏi màn hình
    if ball.pos[1] > HEIGHT or ball.pos[0]<0 or ball.pos[0]>WIDTH or ball.pos[1]<0:
        balls.remove(ball)
        # Tạo 2 bóng mới với vận tốc ngẫu nhiên
        balls.append(Ball(position=[WIDTH // 2, HEIGHT // 2 - 120],
                          velocity=[random.uniform(-4, 4),random.uniform(-1, 1)]))
        balls.append(Ball(position=[WIDTH // 2, HEIGHT // 2 - 120],
                          velocity=[random.uniform(-4, 4),random.uniform(-1, 1)]))

    # Cập nhật vận tốc và vị trí bóng
    ball.v[1] += GRAVITY  # Thêm trọng lực
    ball.pos += ball.v    # Cập nhật vị trí

    # Xử lý va chạm với vòng tròn
    dist = np.linalg.norm(ball.pos - CIRCLE_CENTER)  # Tính khoảng cách từ bóng đến tâm
    if dist + BALL_RADIUS > CIRCLE_RADIUS:  # Nếu bóng chạm vòng tròn
        if is_ball_in_arc(ball.pos, CIRCLE_CENTER, start_angle, end_angle):
            ball.is_in = False   # Nếu trong cung thì cho xuyên qua
        if ball.is_in == True:   # Nếu không trong cung thì bật lại
            # Tính vector pháp tuyến
            d = ball.pos - CIRCLE_CENTER
            d_unit = d/np.linalg.norm(d)

            # Đặt bóng về vị trí đúng trên vòng tròn
            ball.pos = CIRCLE_CENTER + (CIRCLE_RADIUS - BALL_RADIUS) * d_unit

            # Tính vector tiếp tuyến
            t = np.array([-d[1],d[0]], dtype=np.float64)

            # Tính phản xạ vận tốc
            proj_v_t = (np.dot(ball.v,t)/np.dot(t,t)) * t  # Chiếu vận tốc lên tiếp tuyến
            ball.v = 2 * proj_v_t - ball.v  # Phản xạ vận tốc
            ball.v += t * spinning_speed  # Thêm vận tốc từ chuyển động quay
    window.fill(BLACK)
    pygame.draw.circle(window, ORANGE, CIRCLE_CENTER, CIRCLE_RADIUS, 3)
    draw_arc(window, CIRCLE_CENTER, CIRCLE_RADIUS, start_angle, end_angle)
    for ball in balls:
        pygame.draw.circle(window, ball.color, ball.pos, BALL_RADIUS)
    pygame.display.flip()
    clock.tick(60)
pygame.quit()