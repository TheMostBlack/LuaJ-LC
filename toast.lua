import "android.widget.LinearLayout"
import "android.widget.CardView"
import "android.widget.TextView"
import "android.widget.Toast"
import "android.view.Gravity"
function print(内容)
  tsbj={
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    gravity="center";
    orientation="vertical";
    {
      CardView;
      radius=15,
      CardElevation="0dp";
      backgroundColor="0xff6f6f6f";
      {
        TextView;
        layout_marginRight="35dp";
        text="提示";
        id="提示内容",
        textColor="0xffffffff";
        layout_marginLeft="35dp";
        layout_marginTop="10dp";
        layout_gravity="center";
        layout_marginBottom="10dp";
      };
    };
  };
  local toast=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(tsbj))
  toast.setGravity(Gravity.BOTTOM,0,100)
  提示内容.Text=tostring(内容)
  toast.show()
end