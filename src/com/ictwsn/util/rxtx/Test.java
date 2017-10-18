package com.ictwsn.util.rxtx;

public class Test {

	public static void main(String[] args){
		SerialPortListener s=SerialPortListener.getInstance();
		s.listPort();
	}
}
