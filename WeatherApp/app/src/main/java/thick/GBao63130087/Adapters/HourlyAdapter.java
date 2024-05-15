package thick.GBao63130087.Adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import thick.GBao63130087.Domains.Hourly;
import thick.GBao63130087.R;


public class HourlyAdapter extends RecyclerView.Adapter<HourlyAdapter.ViewHolder> {
    ArrayList<Hourly> items;
    Context context;

    public HourlyAdapter(ArrayList<Hourly> items) {
        this.items = items;
    }

    @NonNull
    @Override
    public HourlyAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        // khởi tạo ViewHolder và gán layout
        View inflate = LayoutInflater.from(parent.getContext()).inflate(R.layout.viewholder_hourly, parent, false);
        context = parent.getContext();
        // trả về ViewHolder và hiển thị các mục trong RecyclerView
        return new ViewHolder(inflate);
    }

    @Override
    public void onBindViewHolder(@NonNull HourlyAdapter.ViewHolder holder, int position) {
        // lấy giá trị từ Hourly
        holder.hourTxt.setText(items.get(position).getHour());
        holder.tempTxt.setText(items.get(position).getTemp() + "°");

        // định danh ảnh trong drawable, lưu trong list
        int drawableResourceId = context.getResources()
                .getIdentifier(items.get(position).getPicPath(), "drawable", context.getPackageName());
        // thư viện glide tải ảnh
        Glide.with(context).load(drawableResourceId).into(holder.pic);
    }

    @Override
    public int getItemCount() {
        // trả về đúng số lương items trong List
        return items.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView hourTxt, tempTxt;
        ImageView pic;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            // ánh xạ với các thành phần viewholder_hourly
            hourTxt = itemView.findViewById(R.id.hourTxt);
            tempTxt = itemView.findViewById(R.id.tempTxt);
            pic = itemView.findViewById(R.id.pic);
        }
    }
}
