package com.cherryfunding.spring.util;

public class StringLengthCut {
	private static int CUTLEN = 135;

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

	public static String getString(String str, int inputLength) throws Exception {
		if (!str.isEmpty()) {
			str = str.trim();
			if (str.getBytes().length <= inputLength) {
				return str;
			} else {
				StringBuffer sbStr = new StringBuffer(inputLength);
				int nCnt = 0;
				for (char ch : str.toCharArray()) {
					nCnt += String.valueOf(ch).getBytes().length;
					if (nCnt > inputLength)
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
