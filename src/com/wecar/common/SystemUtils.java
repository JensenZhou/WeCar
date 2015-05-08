package com.wecar.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SystemUtils {
	public static String encryptPWD(String code) {
		StringBuffer buf = new StringBuffer("");
		try{
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(code.getBytes());
		byte b[] = md.digest();
		int i;
		for(int offset = 0; offset < b.length; offset++){
			i = b[offset];
			if (i < 0){i += 256;}
			if (i <16){buf.append("0");}
			buf.append(Integer.toHexString(i));
		}
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return(buf.toString());
	}
	
	public static void main(String[] args) {
		System.out.println(encryptPWD("admin"));
	}
}
