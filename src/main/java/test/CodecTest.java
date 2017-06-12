package test;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by Administrator on 2017/2/10.
 */
public class CodecTest {
    public static void main(String[] args) {
        String plainPassword = "123";
        String encryptedPassword = DigestUtils.md5Hex(plainPassword);
        System.out.println(encryptedPassword);
    }
}
