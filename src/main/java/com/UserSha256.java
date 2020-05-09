package com;

import java.security.MessageDigest;

public class UserSha256 { //sha256방식으로 암호화하는 메소드
	public static String encrypt(String planText) { //매개변수에 param값으로 넘어온 비밀번호를 넣어준다
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
					
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i< byteData.length; i++) {
					String hex = Integer.toHexString(0xff & byteData[i]);
						if(hex.length() == 1) {
							hexString.append('0');
						}
						hexString.append(hex);
			}
			return hexString.toString();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new RuntimeException();
			// TODO: handle exception
		}
	}
}
