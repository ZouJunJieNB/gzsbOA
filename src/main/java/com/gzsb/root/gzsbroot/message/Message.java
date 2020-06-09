package com.gzsb.root.gzsbroot.message;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * Created by KW-LL on 2019/3/16.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Message implements Serializable {

    /**
     * 返回状态码
     */
    @JSONField()
    private String code;

    /**
     * 返回消息
     */
    private String message;

    /**
     * 返回数据（单对象）
     */
    private Object data;

    /**
     * 数据列表所有
     */
    @JSONField()
    private Long total;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    //防止外部实例化
    private Message() {
    }

    private Message(String code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    //成功
    public static Message success() {
        return newMsg(SuccessMessage.success());
    }

    public static Message success(Object object) {
        return newMsg(SuccessMessage.success(), object);
    }

    public static Message failure() {
        return newMsg(SuccessMessage.failure());
    }



    //具体参数形式
    public static Message newMsg(String code, String message) {
        return newMsg(code, message, null);
    }

    public static Message newMsg(String code) {
        return newMsg(code, null);
    }

    public static Message newMsg(String code, String message, Object data) {
        return new Message(code, message, data);
    }

    //模板形式
    public static Message newMsg(BaseMessage baseMessage) {
        return newMsg(baseMessage.getCode(), baseMessage.getMessage(), baseMessage.getData());
    }

    public static Message newMsg(BaseMessage baseMessage, Object data) {
        return newMsg(baseMessage.getCode(), baseMessage.getMessage(), data);
    }
}
