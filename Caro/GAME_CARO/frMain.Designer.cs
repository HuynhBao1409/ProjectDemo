namespace GAME_CARO
{
    partial class frMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frMain));
            this.pnLeft = new System.Windows.Forms.Panel();
            this.lbNamePlayerA = new System.Windows.Forms.Label();
            this.btnNewGame = new System.Windows.Forms.Button();
            this.btnPC = new System.Windows.Forms.Button();
            this.btnPerson = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.pnRight = new System.Windows.Forms.Panel();
            this.lbNamePlayerB = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.pnCenter = new System.Windows.Forms.Panel();
            this.pnLeft.SuspendLayout();
            this.pnRight.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnLeft
            // 
            this.pnLeft.BackColor = System.Drawing.Color.Ivory;
            this.pnLeft.Controls.Add(this.lbNamePlayerA);
            this.pnLeft.Controls.Add(this.btnNewGame);
            this.pnLeft.Controls.Add(this.btnPC);
            this.pnLeft.Controls.Add(this.btnPerson);
            this.pnLeft.Controls.Add(this.label1);
            this.pnLeft.Location = new System.Drawing.Point(5, 15);
            this.pnLeft.Margin = new System.Windows.Forms.Padding(4);
            this.pnLeft.Name = "pnLeft";
            this.pnLeft.Size = new System.Drawing.Size(200, 641);
            this.pnLeft.TabIndex = 0;
            // 
            // lbNamePlayerA
            // 
            this.lbNamePlayerA.AutoSize = true;
            this.lbNamePlayerA.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNamePlayerA.Location = new System.Drawing.Point(54, 93);
            this.lbNamePlayerA.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbNamePlayerA.Name = "lbNamePlayerA";
            this.lbNamePlayerA.Size = new System.Drawing.Size(71, 19);
            this.lbNamePlayerA.TabIndex = 2;
            this.lbNamePlayerA.Text = "Player 1";
            // 
            // btnNewGame
            // 
            this.btnNewGame.Location = new System.Drawing.Point(24, 559);
            this.btnNewGame.Margin = new System.Windows.Forms.Padding(4);
            this.btnNewGame.Name = "btnNewGame";
            this.btnNewGame.Size = new System.Drawing.Size(153, 28);
            this.btnNewGame.TabIndex = 1;
            this.btnNewGame.Text = "Game mới";
            this.btnNewGame.UseVisualStyleBackColor = true;
            this.btnNewGame.Click += new System.EventHandler(this.btnNewGame_Click);
            // 
            // btnPC
            // 
            this.btnPC.Location = new System.Drawing.Point(24, 523);
            this.btnPC.Margin = new System.Windows.Forms.Padding(4);
            this.btnPC.Name = "btnPC";
            this.btnPC.Size = new System.Drawing.Size(153, 28);
            this.btnPC.TabIndex = 1;
            this.btnPC.Text = "Chơi với máy";
            this.btnPC.UseVisualStyleBackColor = true;
            this.btnPC.Click += new System.EventHandler(this.btnPC_Click);
            // 
            // btnPerson
            // 
            this.btnPerson.Location = new System.Drawing.Point(24, 487);
            this.btnPerson.Margin = new System.Windows.Forms.Padding(4);
            this.btnPerson.Name = "btnPerson";
            this.btnPerson.Size = new System.Drawing.Size(153, 28);
            this.btnPerson.TabIndex = 1;
            this.btnPerson.Text = "Chơi với người";
            this.btnPerson.UseVisualStyleBackColor = true;
            this.btnPerson.Click += new System.EventHandler(this.btnPerson_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Elephant", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(22, 33);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(155, 22);
            this.label1.TabIndex = 0;
            this.label1.Text = "NGƯỜI CHƠI 1";
            // 
            // pnRight
            // 
            this.pnRight.BackColor = System.Drawing.Color.Ivory;
            this.pnRight.Controls.Add(this.lbNamePlayerB);
            this.pnRight.Controls.Add(this.label2);
            this.pnRight.Location = new System.Drawing.Point(973, 15);
            this.pnRight.Margin = new System.Windows.Forms.Padding(4);
            this.pnRight.Name = "pnRight";
            this.pnRight.Size = new System.Drawing.Size(200, 641);
            this.pnRight.TabIndex = 0;
            // 
            // lbNamePlayerB
            // 
            this.lbNamePlayerB.AutoSize = true;
            this.lbNamePlayerB.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNamePlayerB.Location = new System.Drawing.Point(72, 93);
            this.lbNamePlayerB.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbNamePlayerB.Name = "lbNamePlayerB";
            this.lbNamePlayerB.Size = new System.Drawing.Size(71, 19);
            this.lbNamePlayerB.TabIndex = 2;
            this.lbNamePlayerB.Text = "Player 2";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Elephant", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(20, 33);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(158, 22);
            this.label2.TabIndex = 0;
            this.label2.Text = "NGƯỜI CHƠI 2";
            // 
            // pnCenter
            // 
            this.pnCenter.BackColor = System.Drawing.Color.White;
            this.pnCenter.ForeColor = System.Drawing.Color.Black;
            this.pnCenter.Location = new System.Drawing.Point(216, 15);
            this.pnCenter.Margin = new System.Windows.Forms.Padding(4);
            this.pnCenter.Name = "pnCenter";
            this.pnCenter.Size = new System.Drawing.Size(749, 641);
            this.pnCenter.TabIndex = 0;
            this.pnCenter.Paint += new System.Windows.Forms.PaintEventHandler(this.pnCenter_Paint);
            this.pnCenter.MouseClick += new System.Windows.Forms.MouseEventHandler(this.pnCenter_MouseClick);
            // 
            // frMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1181, 679);
            this.Controls.Add(this.pnCenter);
            this.Controls.Add(this.pnRight);
            this.Controls.Add(this.pnLeft);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frMain";
            this.Text = "GAME CỜ CARO";
            this.Load += new System.EventHandler(this.frMain_Load);
            this.pnLeft.ResumeLayout(false);
            this.pnLeft.PerformLayout();
            this.pnRight.ResumeLayout(false);
            this.pnRight.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnLeft;
        private System.Windows.Forms.Panel pnRight;
        private System.Windows.Forms.Panel pnCenter;
        private System.Windows.Forms.Button btnNewGame;
        private System.Windows.Forms.Button btnPC;
        private System.Windows.Forms.Button btnPerson;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lbNamePlayerA;
        private System.Windows.Forms.Label lbNamePlayerB;
    }
}