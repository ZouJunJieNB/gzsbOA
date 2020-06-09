package com.gzsb.root.gzsbroot.message;

public class LoginMessage extends BaseMessage{
    public LoginMessage(String code, String message) {
        super(code, message);
    }

    public static LoginMessage operator_not_exist(){
        return new LoginMessage("operator_not_exist","未知账户");
    }

    public static LoginMessage password_error() {
        return new LoginMessage("password_error","密码错误");
    }

    public static BaseMessage operator_disabled() {
        return new LoginMessage("operator_disabled","该用户已被禁用");
    }
}
