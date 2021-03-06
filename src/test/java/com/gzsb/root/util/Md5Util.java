package com.gzsb.root.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @Author: 谅搁
 * @Date: 2019/10/17 15:40
 * description:
 */
public class Md5Util {
    /**
     * Md5加密
     *
     * @param str
     * @param salt
     * @return
     */
    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt, 2).toHex().toString();
    }

    public static String md5(String str) {
        return new Md5Hash(str).toHex().toString();
    }
    /**
     * base64加密
     *
     * @param str
     * @return
     */
    public static String encBase64(String str) {
        return Base64.encodeToString(str.getBytes());
    }

    /**
     * base64解密
     *
     * @param str
     * @return
     */
    public static String decBase64(String str) {
        return Base64.decodeToString(str);
    }

    public static void main(String[] args) {
        String password = "123456";


        System.out.println("Md5加密：" + Md5Util.md5(password));
    }
}
