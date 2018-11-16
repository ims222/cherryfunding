package com.cherryfunding.spring.util;

public class StringLengthCut {
	private static int CUTLEN = 100;

	public static String getString(String str) throws Exception {
		if (!str.isEmpty()) {
			str = str.trim();
			if (str.getBytes().length <= CUTLEN) {
				return str;
			} else {
				StringBuffer sbStr = new StringBuffer(CUTLEN);
				int nCnt = 0;
				for (char ch : str.toCharArray()) {
					nCnt += String.valueOf(ch).getBytes().length;
					if (nCnt > CUTLEN)
						break;
					sbStr.append(ch);
				}
				return sbStr.toString() + "...";
			}
		} else {
			return "";
		}
	}

}
