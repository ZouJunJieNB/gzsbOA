package com.gzsb.root.gzsbroot.message;


public class BaseMessage extends Exception {

    private String code="SUCCESS";

    private String msg;

    private Object data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public BaseMessage() {}

    public BaseMessage(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public BaseMessage(String code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public BaseMessage(Object data) {
        this.data = data;
    }

    public static BaseMessage success(){
        return new BaseMessage();
    }

    public static BaseMessage success(Object data){
        return new BaseMessage(data);
    }

    public static BaseMessage success(String code, String msg, Object data){
        return new BaseMessage(code,msg,data);
    }


    public static BaseMessage error(String code, String msg, Object data){
        return new BaseMessage(code,msg,data);
    }

    public static BaseMessage error(String code, String msg){
        return new BaseMessage(code,msg);
    }

}
