package thick.GBao63130087.Domains;

public class Hourly {
    private String Hour;
    private int temp;
    private String picPath;

    // Contructor nhận tham số và gán tương ứng vào Hour,temp,pic
    public Hourly(String hour, int temp, String picPath) {
        Hour = hour;
        this.temp = temp;
        this.picPath = picPath;
    }
    // Getter, setter trả và gán giá trị
    public String getHour() {
        return Hour;
    }

    public void setHour(String hour) {
        Hour = hour;
    }

    public int getTemp() {
        return temp;
    }

    public void setTemp(int temp) {
        this.temp = temp;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }
}
