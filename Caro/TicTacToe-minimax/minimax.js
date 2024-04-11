function bestMove() {
    // lượt đi của Bot
    let bestScore = -Infinity; //khởi tạo biến để lưu kết quả tốt nhất
    let move;
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        // ô đó có trống không
        if (board[i][j] == '') {
          board[i][j] = ai; // nếu trống thì gán ô đó cho AI
          let score = minimax(board, 0, false); // gọi hàm minimax để đánh giá điểm của nước đi đó
          board[i][j] = '';
          //So sánh điểm score của nước đi hiện tại
          if (score > bestScore) { //Nếu score lớn hơn bestScore 
            bestScore = score; //Cập nhật lại bestScore = score
            move = { i, j }; //Gán vị trí ô hiện tại (i, j) vào biến move
          }
        }
      }
    }
    board[move.i][move.j] = ai; //Đánh dấu ô di chuyển tối ưu nước đi của Bot
    currentPlayer = human; //trả quyền lại cho người chơi
  }
  
  
  function minimax(board, depth, isMaximizing) {
    //ktra có người thắng hay chưa
    let result = checkWinner(); 
    if (result !== null) { //Null nếu chưa có người thắng
      return scores[result]; //Nếu trả về chữ "X", "O" nếu có người thắng tương ứng
    }
  
    if (isMaximizing) {
      let bestScore = -Infinity; //khởi tạo biến để lưu kết quả tốt nhất
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          // ktra có để trống ô không
          if (board[i][j] == '') { 
            board[i][j] = ai; //Nếu trống gán giá trị ô đó là ai
            let score = minimax(board, depth + 1, false); //Gọi đệ quy minimax để đánh giá nước đi đó, depth tăng thêm 1
            board[i][j] = '';
            bestScore = max(score, bestScore); //Sử dụng hàm max để lấy kết quả lớn nhất gán vào bestScore 
          }
        }
      }
      return bestScore;
    } else { //của người chơi
      let bestScore = Infinity; //khởi tạo biến để lưu kết quả tốt nhất
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          // ktra có để trống ô không
          if (board[i][j] == '') {
            board[i][j] = human; //Nếu trống gán giá trị ô đó là người chơi
            let score = minimax(board, depth + 1, true); //Gọi đệ quy minimax để đánh giá nước đi đó, depth tăng thêm 1
            board[i][j] = '';
            bestScore = min(score, bestScore);//Sử dụng hàm max để lấy kết quả lớn nhất gán vào bestScore 
          }
        }
      }
      return bestScore;
    }
  }