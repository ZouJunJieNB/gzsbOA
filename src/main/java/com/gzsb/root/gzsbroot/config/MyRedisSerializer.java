package com.gzsb.root.gzsbroot.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.nio.charset.Charset;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/10 17:25
 * description:
 */
@Component
public class MyRedisSerializer implements RedisSerializer<String> {

    private final static Logger logger = LoggerFactory.getLogger(MyRedisSerializer.class);
    private final Charset charset;

    @Override
    public byte[] serialize(String string) throws SerializationException {
        String keyPrefix = "jnoa:";
        String key = keyPrefix + string;
        logger.info("key:{}", key);
        return (key == null ? null : key.getBytes(charset));
    }

    @Override
    public String deserialize(byte[] bytes) throws SerializationException {
        String keyPrefix = "jnoa:";
        String saveKey = new String(bytes, charset);
        int indexOf = saveKey.indexOf(keyPrefix);
        if (indexOf > 0) {
            System.out.println("key缺少前缀");
        } else {
            saveKey = saveKey.substring(indexOf);
        }
        System.out.println("saveKey:" + saveKey);
        return (saveKey.getBytes() == null ? null : saveKey);
    }

    public MyRedisSerializer() {
        this(Charset.forName("UTF8"));
    }

    public MyRedisSerializer(Charset charset) {
        Assert.notNull(charset, "Charset must not be null!");
        this.charset = charset;
    }
}
