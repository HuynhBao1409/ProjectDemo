package thick.GBao63130087.Activitis;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import java.util.ArrayList;

import thick.GBao63130087.Adapters.TomorrowAdapter;
import thick.GBao63130087.Domains.TomorrowDomain;
import thick.GBao63130087.R;

public class TomorrowActivity extends AppCompatActivity {

    private RecyclerView.Adapter adapterTomorrow;
    private RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tomorrow);

        initRecyclerView();
        setVariable();
    }

    // Quay lại MainActivity
    private void setVariable() {
        // ánh xạ giá trị tới img_Btn
        ImageView backButton = findViewById(R.id.img_Btn);
        // sự kiện bộ lắng nghe OnClick
        // Chuyển màn MainActivity->TomorrowActivity
        backButton.setOnClickListener(v -> startActivity(new Intent(TomorrowActivity.this, MainActivity.class)));
    }


    private void initRecyclerView() {
        // tương tự MainActivity
        ArrayList<TomorrowDomain> items=new ArrayList<>();
        // thêm giá trị vào TomorrowDomain
        items.add(new TomorrowDomain("CN","sun","Nắng",35,25));
        items.add(new TomorrowDomain("T2","cloudy","Ít mây",32,24));
        items.add(new TomorrowDomain("T3","cloudy_3","Mây mù",33,25));
        items.add(new TomorrowDomain("T4","cloudy_sunny","Mây vài nơi",33,25));
        items.add(new TomorrowDomain("T5","rainy","Mưa",27,20));
        items.add(new TomorrowDomain("T6","storm","Mưa lớn",26,20));
        items.add(new TomorrowDomain("T7","wind","Gió",33,25));

        recyclerView=findViewById(R.id.view2);
        recyclerView.setLayoutManager(new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false));

        adapterTomorrow = new TomorrowAdapter(items); // Tạo adapter và chuyển danh sách items
        recyclerView.setAdapter(adapterTomorrow); // Gán adapter cho RecyclerView
    }
}