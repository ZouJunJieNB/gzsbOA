package com.gzsb.root.gzsbroot.message;

public class SysMessage extends BaseMessage {

    public static BaseMessage system_error(String msg){
        return BaseMessage.error("system_error",msg);
    }
    public static BaseMessage param_error(String msg){
        return BaseMessage.error("param_error",msg);
    }

}
