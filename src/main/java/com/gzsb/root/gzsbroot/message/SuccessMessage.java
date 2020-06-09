package com.gzsb.root.gzsbroot.message;

/** 请求成功模板    0
 * Created by KW-LL on 2019/3/16.
 */
public class SuccessMessage extends BaseMessage{
    public SuccessMessage(String code, String message) {
        super(code, message);
    }

    public static SuccessMessage success(){
        return new SuccessMessage("SUCCESS",null);
    }
    public static SuccessMessage failure(){
        return new SuccessMessage("FAILURE",null);
    }
}
