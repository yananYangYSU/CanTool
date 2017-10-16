package com.ictwsn.util.cantool;

import net.sf.json.JSONArray;



public class Test {
	public static void main(String[] args){
		
		String a=JSONArray.fromObject(LoadDataBase.getCanSignalMap()).toString();
		System.out.println(a);
	}

}
