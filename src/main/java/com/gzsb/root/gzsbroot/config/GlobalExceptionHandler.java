package com.gzsb.root.gzsbroot.config;

import com.gzsb.root.gzsbroot.message.BaseMessage;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.message.SysMessage;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 自定义异常以及全局异常捕获处理
 */
@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {



    @ExceptionHandler(value = BaseMessage.class)
    public Message baseException(HttpServletRequest req, BaseMessage e) throws Exception {
        return Message.newMsg(e.getCode(),e.getMsg());
    }

    /**
     * 系统错误拦截
     * @param req
     * @param e
     * @return
     * @throws Exception
     */
    @ExceptionHandler(value = Exception.class)
    public Message defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        e.printStackTrace();
        BaseMessage baseMessage= SysMessage.system_error("系统错误!");
        return Message.newMsg(baseMessage.getCode(),baseMessage.getMsg(),e.getMessage());
    }
}
