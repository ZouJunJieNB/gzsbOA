package com.gzsb.root.gzsbroot.utils;

import com.gzsb.root.gzsbroot.message.Message;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/4 13:39
 * description:
 */
public class Verify {
    /**
     * 逻辑判断
     * @param result
     * @return
     */
    public static Message comeVerify(int result){
        if (result > 0) {
            return Message.success();
        } else {
            return Message.failure();
        }
    }
}
