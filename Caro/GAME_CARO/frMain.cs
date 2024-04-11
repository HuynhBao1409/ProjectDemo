using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GAME_CARO
{
    public partial class frMain : Form
    {
        private const int MAX_LINE_Y = 30;//số đường vẽ đứng
        private const int MAX_LINE_X = 30;//số đường vẽ ngang

        private const int CHESSBOARD_WIDTH = 560;// độ rộng của bàn cờ
        private const int CHESSBOARD_HIGHT = 520; //chiều cao của bàn cờ

        private const int CHESSMAN_PLAYER_A = 1;//mình gán 1 sẽ là giá trị quân cờ của người chơi 1
        private const int CHESSMAN_PLAYER_B = 2;//tương tự 2 sẽ là giá trị quân cờ của người chơi 2
        private const int DISTANCE_BETWEEN_TWO_LINES = 20;//khoảng cách giữa hai đường thẳng trên bàn cờ
        private Color CHESSBOARD_COLOR = Color.White;//màu của bàn cờ
        //
        Chessboard chessboard;
        private bool isPlayerA = true;//có phải là lượt của người chơi A hay không
        static Boolean isPlayWithPC = true;//có phải chơi với máy hay không
        static Boolean isPlayerAWin = true;//có phải A chiến thắng
        private const int NUM_CHESSMAN_WIN = 4;
        //
        static Boolean isNextGame = true;
        Player playerA;//người chơi A,B
        Player playerB;
        //
        static int currRowPutChessmanPC;
        static int currCellPutChessmanPC;
        //
        private int[] attackScore = new int[6] { 0, 1, 9, 81, 729, 59049 };//mảng điểm tấn công
        private int[] defenseScore = new int[6] { 0, 2, 18, 162, 1458, 118098 };//mảng điểm phòng ngự, phòng ngự được ưu tiên
        public frMain()
        {
            InitializeComponent();
        }

        // giao diện bàn cờ
        private void frMain_Load(object sender, EventArgs e)
        {
            int cellChessBoard = CHESSBOARD_WIDTH / DISTANCE_BETWEEN_TWO_LINES;// số cột trên bàn cờ
            int rowChessBoard = CHESSBOARD_HIGHT / DISTANCE_BETWEEN_TWO_LINES;// số hàng
            chessboard = new Chessboard(rowChessBoard, cellChessBoard);
            currRowPutChessmanPC = 0;
            currCellPutChessmanPC = 0;
            if (isPlayWithPC) //Nếu chơi với máy tính Tạo 2 người chơi, người chơi A và máy tính
            {
                playerA = new Player(1, "PLAYER A");
                playerB = new Player(2, "PC");
            }
            else
            {
                playerA = new Player(1, "PLAYER A");
                playerB = new Player(2, "PLAYER B");
            }
            lbNamePlayerA.Text = playerA.Name;
            lbNamePlayerB.Text = playerB.Name;
        }

        private void pnCenter_Paint(object sender, PaintEventArgs e)    
        {
            setColorChessboard();
            drawLineInChessboard(e);
            //vẽ bàn cờ caro ở đây
        }
        private void drawLineInChessboard(PaintEventArgs e)
        {
            Pen pen = new Pen(Color.FromArgb(255, 0, 0, 0));
            for (int i = 0; i <= MAX_LINE_Y; i++)
            {
                e.Graphics.DrawLine(pen, i * DISTANCE_BETWEEN_TWO_LINES, 0, i * DISTANCE_BETWEEN_TWO_LINES, CHESSBOARD_HIGHT);
            }
            for (int j = 0; j <= MAX_LINE_X; j++)
            {
                e.Graphics.DrawLine(pen, 0, j * DISTANCE_BETWEEN_TWO_LINES, CHESSBOARD_WIDTH, j * DISTANCE_BETWEEN_TWO_LINES);
            }
        }
        private void setColorChessboard()
        {
            pnCenter.BackColor = CHESSBOARD_COLOR;
        }

        //Xử lý click chuột trên bàn cờ 
        private void pnCenter_MouseClick(object sender, MouseEventArgs e)
        {
            Chessman chessman = new Chessman();
            chessman.X = (e.X / DISTANCE_BETWEEN_TWO_LINES) * DISTANCE_BETWEEN_TWO_LINES;
            chessman.Y = (e.Y / DISTANCE_BETWEEN_TWO_LINES) * DISTANCE_BETWEEN_TWO_LINES;
            chessman.Width = DISTANCE_BETWEEN_TWO_LINES - 1;
            chessman.Height = DISTANCE_BETWEEN_TWO_LINES - 1;

            int rowPutChessman = chessman.Y / DISTANCE_BETWEEN_TWO_LINES;
            int cellPutChessman = chessman.X / DISTANCE_BETWEEN_TWO_LINES;

            Graphics g;
            g = pnCenter.CreateGraphics();

            Rectangle rectangle = new Rectangle();
            PaintEventArgs arg = new PaintEventArgs(g, rectangle);

            if (!isDuplicatePutChessman(rowPutChessman, cellPutChessman))
            {
                return;//nếu trùng thì return luôn
            }
            if (isNextGame == false)//trò chơi có tiếp tục hay không
            {
                return;
            }
            if (isPlayWithPC)//nếu là chơi với máy
            {
                chessman.drawChessmanPlayerA(arg, chessman);//vẽ quân cờ
                chessboard.ObjChessbroad[rowPutChessman, cellPutChessman] = CHESSMAN_PLAYER_A;//khởi tạo quân cờ được vẽ trong mảng
                if (isGameOver() == false)
                { //ktra thắng thua
                    string str = isPlayerAWin == true ? playerA.Name : playerB.Name;
                    MessageBox.Show("GAME ORVER ! - " + str + " WIN");
                    isNextGame = false;
                    return;
                }
                //giải thuật Minimax áp dụng cho cờ caro 
                assessMoves();
                chessman = new Chessman();
                chessman.Width = DISTANCE_BETWEEN_TWO_LINES - 1;
                chessman.Height = DISTANCE_BETWEEN_TWO_LINES - 1;
                chessman.Y = currRowPutChessmanPC * DISTANCE_BETWEEN_TWO_LINES;
                chessman.X = currCellPutChessmanPC * DISTANCE_BETWEEN_TWO_LINES;
                chessman.drawChessmanPlayerB(arg, chessman);
                chessboard.ObjChessbroad[currRowPutChessmanPC, currCellPutChessmanPC] = CHESSMAN_PLAYER_B;
                if (isGameOver() == false)
                {
                    string str = isPlayerAWin == true ? playerA.Name : playerB.Name;
                    MessageBox.Show("GAME ORVER ! - " + str + " WIN");
                    isNextGame = false;
                }
            }
            else
            { //người chơi với người 
                if (isPlayerA) // luân phiên 2 người 
                {
                    chessman.drawChessmanPlayerA(arg, chessman);
                    chessboard.ObjChessbroad[rowPutChessman, cellPutChessman] = CHESSMAN_PLAYER_A;
                    isPlayerA = false;
                }
                else if (!isPlayerA)
                {
                    chessman.drawChessmanPlayerB(arg, chessman);
                    chessboard.ObjChessbroad[rowPutChessman, cellPutChessman] = CHESSMAN_PLAYER_B;
                    isPlayerA = true;
                }
                if (isGameOver() == false)
                {
                    string str = isPlayerAWin == true ? playerA.Name : playerB.Name;
                    MessageBox.Show("GAME ORVER ! - " + str + " WIN");
                    isNextGame = false;
                }
            }
        }
        private Boolean isDuplicatePutChessman(int rowPutChessman, int cellPutChessman)//hàm này sẽ kiểm tra xem hai quân cờ có đc đặt trùng lên nhau không
        {
            if (chessboard.ObjChessbroad[rowPutChessman, cellPutChessman].Equals(CHESSMAN_PLAYER_A)
                || chessboard.ObjChessbroad[rowPutChessman, cellPutChessman].Equals(CHESSMAN_PLAYER_B))
            {
                return false;
            }
            return true;
        }
        private Boolean isGameOver()//hàm kiểm tra game đã kết thúc hay chưa
        {
            int countRow;
            int countCell;
            int countCrossLineRight;
            int countCrossLineLeft;
            for (int rowChessboard = 0; rowChessboard < chessboard.Row; rowChessboard++)//duyệt trong mảng bàn cờ hàng ngang, đường chéo ,cột dọc,
                                                                                        //nếu người chời nào đủ 5 quân xếp cùng một hàng thì game kết thúc
            {
                for (int cellChessboard = 0; cellChessboard < chessboard.Cell; cellChessboard++)
                {
                    countRow = 0;
                    countCell = 0;
                    countCrossLineRight = 0;
                    countCrossLineLeft = 0;

                    int minIRow = rowChessboard - NUM_CHESSMAN_WIN > 0 ? rowChessboard - NUM_CHESSMAN_WIN : 0;
                    int maxIRow = rowChessboard + NUM_CHESSMAN_WIN > chessboard.Row ? chessboard.Row : rowChessboard + NUM_CHESSMAN_WIN;

                    int minICell = cellChessboard - NUM_CHESSMAN_WIN > 0 ? cellChessboard - NUM_CHESSMAN_WIN : 0;
                    int maxICell = cellChessboard + NUM_CHESSMAN_WIN > chessboard.Cell ? chessboard.Cell : cellChessboard + NUM_CHESSMAN_WIN;
                    int objTem = chessboard.ObjChessbroad[rowChessboard, cellChessboard];
                    if (objTem == 0) continue;
                    for (int iRow = minIRow; iRow < maxIRow; iRow++)
                    {
                        for (int iCell = minICell; iCell < maxICell; iCell++)
                        {
                            // hàng ngang
                            if (chessboard.ObjChessbroad[iRow, iCell] == 0) continue;
                            //Kiểm tra ô hiện tại có quân cờ không, nếu không thì next.
                            if (chessboard.ObjChessbroad[iRow, iCell] != objTem) continue;
                            //Kiểm tra màu quân cờ hiện tại có trùng với quân cờ đang kiểm tra không.
                            if (rowChessboard == iRow) 
                            {
                                if (objTem == CHESSMAN_PLAYER_A)
                                {
                                    isPlayerAWin = true;
                                }
                                else
                                {
                                    isPlayerAWin = false;
                                }
                                if (countRow == 0)
                                {
                                    countRow++;
                                }
                                else if (countRow >= 1)
                                {
                                    //Kiểm tra quân tiếp theo cùng màu thì countRow++, khác màu thì reset countRow = 0
                                    if (chessboard.ObjChessbroad[iRow, iCell - 1] == chessboard.ObjChessbroad[iRow, iCell])
                                    {
                                        countRow++;
                                    }
                                    else
                                    {
                                        countRow = 0;
                                    }
                                }
                            }
                            //hàng dọc
                            if (cellChessboard == iCell)
                            {
                                //Kiểm tra xem đang duyệt cột giống với cột của quân ban đầu
                                if (objTem == CHESSMAN_PLAYER_A)
                                {
                                    isPlayerAWin = true;
                                }
                                else
                                {
                                    isPlayerAWin = false;
                                }
                                if (countCell == 0)
                                {
                                    countCell++;
                                }
                                else if (countCell >= 1)
                                {
                                    //Kiểm tra quân tiếp theo cùng màu thì countRow++, khác màu thì reset countRow = 0
                                    if (chessboard.ObjChessbroad[iRow - 1, iCell] == chessboard.ObjChessbroad[iRow, iCell])
                                    {
                                        countCell++;
                                    }
                                    else
                                    {
                                        countCell = 0;
                                    }
                                }
                            }
                            //hàng chéo phải
                            if (rowChessboard - iRow == cellChessboard - iCell)
                            {
                                if (objTem == CHESSMAN_PLAYER_A)
                                {
                                    isPlayerAWin = true;
                                }
                                else
                                {
                                    isPlayerAWin = false;
                                }
                                if (countCrossLineRight == 0)
                                {
                                    countCrossLineRight++;
                                }
                                else if (countCrossLineRight >= 1)
                                {
                                    //Kiểm tra quân tiếp theo cùng màu thì countRow++, khác màu thì reset countRow = 0
                                    if (chessboard.ObjChessbroad[iRow - 1, iCell - 1] == chessboard.ObjChessbroad[iRow, iCell])
                                    {
                                        countCrossLineRight++;
                                    }
                                    else
                                    {
                                        countCrossLineRight = 0;
                                    }
                                }
                            }
                            //hàng chéo trái
                            if (rowChessboard - iRow == -1 * (cellChessboard - iCell))
                            {
                                if (objTem == CHESSMAN_PLAYER_A)
                                {
                                    isPlayerAWin = true;
                                }
                                else
                                {
                                    isPlayerAWin = false;
                                }
                                if (countCrossLineLeft == 0)
                                {
                                    countCrossLineLeft++;
                                }
                                else if (countCrossLineLeft >= 1)
                                {
                                    //Kiểm tra quân tiếp theo cùng màu thì countRow++, khác màu thì reset countRow = 0
                                    if (chessboard.ObjChessbroad[iRow - 1, iCell + 1] == chessboard.ObjChessbroad[iRow, iCell])
                                    {
                                        countCrossLineLeft++;
                                    }
                                    else
                                    {
                                        countCrossLineLeft = 0;
                                    }
                                }
                            }
                        }
                    }
                    if (countRow == NUM_CHESSMAN_WIN + 1
                       || countCell == NUM_CHESSMAN_WIN + 1
                       || countCrossLineRight == NUM_CHESSMAN_WIN + 1
                       || countCrossLineLeft == NUM_CHESSMAN_WIN + 1)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
        #region AI
        private void assessMoves()//hàm đánh giá nước đi
        {
            long maxScore = 0;
            long temScore = 0;
            for (int rowChessboard = 0; rowChessboard < chessboard.Row; rowChessboard++)
            {
                for (int cellChessboard = 0; cellChessboard < chessboard.Cell; cellChessboard++)
                {
                    if (chessboard.ObjChessbroad[rowChessboard, cellChessboard] == 0)
                    {
                        long attackScore = attackScore_Row(rowChessboard, cellChessboard) + attackScore_Cell(rowChessboard, cellChessboard)
                                           + attackScore_CrossRight(rowChessboard, cellChessboard) + attackScore_CrossLeft(rowChessboard, cellChessboard);
                        long defenceScore = defenceScore_Row(rowChessboard, cellChessboard) + defenceScore_Cell(rowChessboard, cellChessboard)
                                            + defenceScore_CrossRight(rowChessboard, cellChessboard) + defenceScore_CrossLeft(rowChessboard, cellChessboard);
                        temScore = attackScore > defenceScore ? attackScore : defenceScore;
                        if (maxScore < temScore)
                        {
                            maxScore = temScore;
                            currRowPutChessmanPC = rowChessboard;
                            currCellPutChessmanPC = cellChessboard;
                        }
                    }
                }
            }
        }
        #region attack
        private long attackScore_Row(int currRow, int currCell)//tính điểm tấn công của nước đi tiếp theo trên hàng ngang
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currRow + iCount < chessboard.Row; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currRow - iCount >= 0; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            totalScore -= defenseScore[numChessmanPlayerB];
            totalScore += attackScore[numChessmanPlayerA];
            return totalScore;
        }
        private long attackScore_Cell(int currRow, int currCell)//cọt dọc
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currCell + iCount < chessboard.Cell; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currCell - iCount >= 0; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            totalScore -= defenseScore[numChessmanPlayerB];
            totalScore += attackScore[numChessmanPlayerA];
            return totalScore;
        }
        private long attackScore_CrossRight(int currRow, int currCell)//chéo phải
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1;
                iCount < NUM_CHESSMAN_WIN + 2 &&
                currCell + iCount < chessboard.Cell &&
                currRow + iCount < chessboard.Row;
                iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1;
                     iCount < NUM_CHESSMAN_WIN + 2 &&
                     currCell - iCount >= 0 &&
                     currRow - iCount >= 0;
                     iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            totalScore -= defenseScore[numChessmanPlayerB];
            totalScore += attackScore[numChessmanPlayerA];
            return totalScore;
        }
        private long attackScore_CrossLeft(int currRow, int currCell) //chéo trái
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1;
                iCount < NUM_CHESSMAN_WIN + 2 &&
                currCell + iCount < chessboard.Cell &&
                currRow - iCount >= 0;
                iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1;
                     iCount < NUM_CHESSMAN_WIN + 2 &&
                     currCell - iCount >= 0 &&
                     currRow + iCount < chessboard.Row;
                     iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                    break;
                }
                else
                {
                    break;
                }
            }
            totalScore -= defenseScore[numChessmanPlayerB];
            totalScore += attackScore[numChessmanPlayerA];
            return totalScore;
        }
        #endregion
        #region defence
        private long defenceScore_Row(int currRow, int currCell) //ttinhs điểm phòng thủ của nước đi tiếp theo trên hàng ngang
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currRow + iCount < chessboard.Row; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currRow - iCount >= 0; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            totalScore += defenseScore[numChessmanPlayerB];
            return totalScore;
        }
        private long defenceScore_Cell(int currRow, int currCell)//cột dọc
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currCell + iCount < chessboard.Cell; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1; iCount < NUM_CHESSMAN_WIN + 2 && currCell - iCount >= 0; iCount++)
            {
                if (chessboard.ObjChessbroad[currRow, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            totalScore += defenseScore[numChessmanPlayerB];
            return totalScore;
        }
        private long defenceScore_CrossRight(int currRow, int currCell)//chéo phải
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1;
                iCount < NUM_CHESSMAN_WIN + 2 &&
                currCell + iCount < chessboard.Cell &&
                currRow + iCount < chessboard.Row;
                iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1;
                     iCount < NUM_CHESSMAN_WIN + 2 &&
                     currCell - iCount >= 0 &&
                     currRow - iCount >= 0;
                     iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            totalScore += defenseScore[numChessmanPlayerB];
            return totalScore;
        }
        private long defenceScore_CrossLeft(int currRow, int currCell)//chéo trái
        {
            long totalScore = 0;
            int numChessmanPlayerA = 0;
            int numChessmanPlayerB = 0;
            for (int iCount = 1;
                iCount < NUM_CHESSMAN_WIN + 2 &&
                currCell + iCount < chessboard.Cell &&
                currRow - iCount >= 0;
                iCount++)
            {
                if (chessboard.ObjChessbroad[currRow - iCount, currCell + iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow - iCount, currCell + iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            for (int iCount = 1;
                     iCount < NUM_CHESSMAN_WIN + 2 &&
                     currCell - iCount >= 0 &&
                     currRow + iCount < chessboard.Row;
                     iCount++)
            {
                if (chessboard.ObjChessbroad[currRow + iCount, currCell - iCount] == CHESSMAN_PLAYER_A)
                {
                    numChessmanPlayerA++;
                    break;
                }
                else if (chessboard.ObjChessbroad[currRow + iCount, currCell - iCount] == CHESSMAN_PLAYER_B)
                {
                    numChessmanPlayerB++;
                }
                else
                {
                    break;
                }
            }
            totalScore += defenseScore[numChessmanPlayerB];
            return totalScore;
        }
        #endregion

        #endregion

        private void btnPerson_Click(object sender, EventArgs e)
        {
            isPlayWithPC = false;
            resetGame(sender, e);
        }

        private void btnPC_Click(object sender, EventArgs e)
        {
            isPlayWithPC = true;
            resetGame(sender, e);
        }

        private void btnNewGame_Click(object sender, EventArgs e)
        {
            resetGame(sender, e);
        }
        private void resetGame(object sender, EventArgs e)
        {
            pnCenter.Invalidate();
            isNextGame = true;
            frMain_Load(sender, e);
        }
    }
}
