let board = [['', '', ''], ['', '', ''], ['', '', '']];

let w; // = width / 3;
let h; // = height / 3;
var x = window.matchMedia('(min-width: 1025px)');

let vvv = 300;
let vvw = 300;

function myFunction(x) {
	if (x.matches) {
		// Nếu đạt điều kiện
		// document.body.style.backgroundColor = "yellow";
	} else {
		//  document.body.style.backgroundColor = "pink";
		vvv = 800;
		vvw = 800;
	}
}

// var x = window.matchMedia("(max-width: 700px)")
myFunction(x); // Gọi chọn X,O
// x.addListener(myFunction)
let ai = '';
let human = prompt('Để bắt đầu game, hãy chọn "X" hoặc "O" ') || 'O';
human = human.toUpperCase();
let currentPlayer = human;
let firstMove;
let firstPlayer;
let scores = {
	X: 10,
	O: -10,
	tie: 0
};


if (human == 'O') {
	ai = 'X';
	firstMove = 'no'
}
else if (human == 'X') {
	scores = {
		X: -10,
		O: 10,
		tie: 0
	};
	ai = 'O';
	firstMove = 'yes'
}
else location.reload();

firstMove = firstMove.toLowerCase();
//đầu vào được chuyển đổi thành chữ thường để tính đến các cách viết khác nhau
if (firstMove == 'yes') firstPlayer = human;
else if (firstMove == 'no') firstPlayer = ai;
else location.reload();

function setup() {
	createCanvas(vvv, vvw);
	w = width / 3;
	h = height / 3;

	let random1 = Math.floor(Math.random() * 3);
	let random2 = Math.floor(Math.random() * 3);
	if (firstPlayer == ai) board[random1][random2] = ai;
	// bestMove();
}

function equals3(a, b, c) {
	return a == b && b == c && a != '';
}
//ktra người thắng qua các đường
function checkWinner() {
	let winner = null;

	// Vòng lặp ktra hàng ngang
	for (let i = 0; i < 3; i++) {
		if (equals3(board[i][0], board[i][1], board[i][2])) {
			winner = board[i][0];
		}
	}

	// Vòng lặp ktra hàngdọc
	for (let i = 0; i < 3; i++) {
		if (equals3(board[0][i], board[1][i], board[2][i])) {
			winner = board[0][i];
		}
	}

	// Đường chéo
	if (equals3(board[0][0], board[1][1], board[2][2])) { //Đườngchéo trái
		winner = board[0][0];
	}
	if (equals3(board[2][0], board[1][1], board[0][2])) { //Đườngchéo phải
		winner = board[2][0];
	}

	let openSpots = 0;
	//duyệt các ô trống trên cờ
	for (let i = 0; i < 3; i++) {
		for (let j = 0; j < 3; j++) {
			if (board[i][j] == '') {
				openSpots++;//nếu trống gán thêm 1
			}
		}
	}
	//nếu chưa ai thắng
	if (winner == null && openSpots == 0) {
		return 'tie';//trả về hòa
	} else {
		return winner;
	}
}

function mousePressed() {
	if (currentPlayer == human) {
		// Lượt người chơi
		//lấy vị trí trong tọa độ chuột cho các ô cờ
		let i = floor(mouseX / w);
		let j = floor(mouseY / h);
		// Nếu hợp lệ
		if (board[i][j] == '') {
			board[i][j] = human;//ô đó là của người
			currentPlayer = ai;//Trả quyền cho AI
			bestMove();
		}
	}
}
//vẽ bàn cờ
function draw() {
	background(255, 255, 255);
	strokeWeight(5);
	// đường kẻ
	line(w, 0, w, height);
	line(w * 2, 0, w * 2, height);
	line(0, h, width, h);
	line(0, h * 2, width, h * 2);
	//Duyệt các hàng, cột trên bàn cờ
	for (let j = 0; j < 3; j++) {
		for (let i = 0; i < 3; i++) {
			let x = w * i + w / 2;
			let y = h * j + h / 2;
			let spot = board[i][j];
			textSize(32);
			let r = w / 4;
		//Vẽ ký hiệu 'X', 'O', Phân 'X','O' giữa người với máy
			if (spot == human && human == 'O') {
				noFill();
				ellipse(x, y, r * 2);
			} else if (spot == human && human == 'X') {
				line(x - r, y - r, x + r, y + r);
				line(x + r, y - r, x - r, y + r);
			}
			if (spot == ai && ai == 'O') {
				noFill();
				ellipse(x, y, r * 2);
			} else if (spot == ai && ai == 'X') {
				line(x - r, y - r, x + r, y + r);
				line(x + r, y - r, x - r, y + r);
			}
		}
	}

	let result = checkWinner();
	if (result != null) {
		noLoop();
		let resultP = createP('');
		resultP.style('font-size', '32pt');
		if (result == 'tie') {
			resultP.html(`<h4 class='result'>Hòa
        <br/>
        <button id='refresh' class='btn btn-outline-primary' onClick="window.location.reload();">Làm mới trang</button>
        </h4>`);
		} else if(result == human){
			resultP.html(`<div class='result' >You(${result})Bạn thắng</div>
        <p id='ps'>Bạn có muốn chơi lại không?
          <br/>
          <button id='refresh' class='btn btn-outline-primary' onClick="window.location.reload();">Làm mới trang</button>
         </p>
        `);
		} else {
			resultP.html(`<div class='result' >Bot thắng</div>
        <p id='ps'>Bạn có muốn chơi lại không?
          <br/>
          <button id='refresh' class='btn btn-outline-primary' onClick="window.location.reload();">Làm mới trang</button>
         </p>
        `);
		}
	}
}

