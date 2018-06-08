package com.qs.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by liq on 2018/5/18.
 */
public final class MD5Util {
    public static String getMd5(String str){
        return DigestUtils.md5Hex(str);
    }
}
