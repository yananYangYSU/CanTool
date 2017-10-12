package com.ictwsn.util.cantool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ictwsn.bean.CanDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.util.format.DataFormat;
/**
 * can信息解码类
 * @author YangYanan
 * @desc 对cantool装置发送到cantoolApp的字符串信息解析
 * @date 2017-10-05
 */
public class UncodeCanMsg {

	private final static int[] byteIndexArray={
		7,6,5,4,3,2,1,0,
		15,14,13,12,11,10,9,8,
		23,22,21,20,19,18,17,16,
		31,30,29,28,27,26,25,24,
		39,28,37,36,35,34,33,32,
		47,46,45,44,43,42,41,40,
		55,54,53,52,51,50,49,48,
		63,62,61,60,59,58,57,56};
	private static Map<Integer,ArrayList<CanSignalBean>> canSignalMap=new HashMap<Integer,ArrayList<CanSignalBean>>();

	static{   
		ArrayList<CanSignalBean> canSignalList=new ArrayList<CanSignalBean>();
		CanSignalBean csb=new CanSignalBean();
		csb.setSignalName("CDU_HVACACCfg");
		csb.setStartBit(12);
		csb.setBitLength(12);
		csb.setBitType(0);
		csb.setResolution(1);
		csb.setOffset(0);
		csb.setMinValue(0);
		csb.setMaxValue(100);
		csb.setUnit("℃");
		String[] nodeNameList={"HVAC1","HAVC2","HAVC3"};
		csb.setNodeNames(nodeNameList);
		canSignalList.add(csb);

		csb=new CanSignalBean();
		csb.setSignalName("CDU_HVACAirCirCfg");
		csb.setStartBit(16);
		csb.setBitLength(12);
		csb.setBitType(0);
		csb.setResolution(1);
		csb.setOffset(0);
		csb.setMinValue(0);
		csb.setMaxValue(100);
		csb.setUnit("℃");
		csb.setNodeNames(nodeNameList);
		canSignalList.add(csb);

		canSignalMap.put(318767095,canSignalList);
		canSignalMap.put(65,null);
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DataFormat dataFormat=DataFormat.getInstance();
		// TODO Auto-generated method stub
		String dataStr="T12FFFFF7800111213141516FF0000\\r";
		UncodeCanMsg t=new UncodeCanMsg();
		System.out.println("message="+dataStr);
		System.out.println("解析后id:"+Integer.parseInt("12FFFFF7",16));
		t.parseCanData(t.splitDataStr(dataStr));
		/*Pattern p=Pattern.compile("[a-]{1,}@[0-9]{1}",Pattern.DOTALL);
		Matcher m=p.matcher("SG_ CDU_HVACAutoModeButtonSt : 2|00001@0+ (1,0) [0|1] \"\"  HVAC");
		while(m.find()){
			System.out.println(m.group());
		}*/
			
		ArrayList<String> dataList=t.splitDataStr(dataStr).getData();
		StringBuffer BitStrIntel=new StringBuffer();
		StringBuffer BitStrMotorola=new StringBuffer();

		int size=dataList.size();
		//intel
		for(int i=size-1;i>=0;i--){
			BitStrIntel.append(dataFormat.hexToBinary(dataList.get(i)));
		}
		System.out.println("----intel matrix-----");

		for(int i=0;i<size;i++){
			System.out.println(dataFormat.hexToBinary(dataList.get(i)));

		}
		System.out.println("intel "+BitStrIntel);
		System.out.println("sub "+BitStrIntel.substring(64-12-12,64-12));
		System.out.println("----motorola-----");
		//motorola
		boolean flag=true;
		//	for(int i=size-1;i>=0;i--){
		for(int i=0;i<size;i++){
			BitStrMotorola.append(dataFormat.hexToBinary(dataList.get(i)));
			/*if(flag==true){
				BitStrMotorola.append(t.hexToBinary(dataList.get(i)));
				flag=!flag;
			}else{
				BitStrMotorola.append(t.reverseStr(t.hexToBinary(dataList.get(i))));
				flag=!flag;
			}		*/	
		}
			System.out.println("----moto matrix-----");
		for(int i=0;i<size;i++){
			System.out.println(dataFormat.hexToBinary(dataList.get(i)));

		}

		System.out.println("motol "+BitStrMotorola);

		System.out.println(t.matrixSubBinStr(BitStrIntel.toString(), 16, 12, 1));
		//System.out.println("motol ");
		//System.out.println(t.matrixSubBinStr(BitStrMotorola.toString(), 11, 12,0));
		 
	}



	/**
	 * can信息字符串的切割提取
	 * @param dataStr "T127FFFFF800111213141516170000\r"或者"t127800111213141516170000\r"
	 * \r为换行符,尽量不要用\\r
	 * @return CanData对象
	 */
	public CanDataBean splitDataStr(String dataStr){
		CanDataBean cd=new CanDataBean();
		dataStr=dataStr.trim();
		dataStr=dataStr.replace("\\r","");
		dataStr=dataStr.replace("\r","");
		if(dataStr.startsWith("t")){
			String id=dataStr.substring(1,4);
			cd.setId(id);
			int dcl=Integer.parseInt(dataStr.substring(4,5));
			cd.setDcl(dcl);
			String data=dataStr.substring(5,(dcl<<1)+5);
			ArrayList<String> dataList=new ArrayList<String>();
			for(int i=0;i<dcl<<1;i=i+2){
				dataList.add(data.substring(i,i+2));
			}
			cd.setData(dataList);
			if((dcl<<1)+9==dataStr.length()){
				String interval=dataStr.substring((dcl<<1)+5,(dcl<<1)+9); 
				cd.setInterval(interval);
			}
		}else if(dataStr.startsWith("T")){
			String id=dataStr.substring(1,9);
			cd.setId(id);
			int dcl=Integer.parseInt(dataStr.substring(9,10));
			cd.setDcl(dcl);
			String data=dataStr.substring(10,(dcl<<1)+10);
			ArrayList<String> dataList=new ArrayList<String>();
			for(int i=0;i<dcl<<1;i=i+2){
				dataList.add(data.substring(i,i+2));
			}
			cd.setData(dataList);
			if((dcl<<1)+14==dataStr.length()){
				String interval=dataStr.substring((dcl<<1)+10,(dcl<<1)+14); 
				cd.setInterval(interval);
			}
		}else{
			System.err.print("can信息格式不正确");
		}
		return cd;

	}
	/**
	 * canData对象信息解析
	 * @param cd
	 */
	public void parseCanData(CanDataBean cd){
		DataFormat dataFormat=DataFormat.getInstance();
		int id=Integer.parseInt(cd.getId(),16);
		ArrayList<CanSignalBean> canSignalList=canSignalMap.get(id);
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
		}else{
			StringBuffer BitStrIntel=new StringBuffer();
			StringBuffer BitStrMotorola=new StringBuffer();
			int dataSize=cd.getData().size();
			/**
			 * intel can二进制矩阵字符串
			 */
			for(int i=dataSize-1;i>=0;i--){
				BitStrIntel.append(dataFormat.hexToBinary(cd.getData().get(i)));
			}
			/**
			 * motorola can二进制矩阵字符串
			 */
			for(int i=0;i<dataSize;i++){
				BitStrMotorola.append(dataFormat.hexToBinary(cd.getData().get(i)));
			}
			/**
			 * 遍历相同id下的信号数据库信息,把can信息从can矩阵中提取解析出来
			 */
			for(CanSignalBean csb:canSignalList){
				String signalName=csb.getSignalName();
				String matrixSubBinStr="";
				if(csb.getBitType()==0){//0代表Motorola格式
					matrixSubBinStr=this.matrixSubBinStr(BitStrMotorola.toString(),csb.getStartBit(),csb.getStartBit(),0);
				}else{//1代表intel格式
					matrixSubBinStr=this.matrixSubBinStr(BitStrIntel.toString(),csb.getStartBit(),csb.getBitLength(),1);
				}
				double x=Integer.parseInt(matrixSubBinStr,2);
				double phy=x*csb.getResolution()+csb.getOffset();
				String unit=csb.getUnit();
				System.out.println("该条信息为:"+signalName+" "+phy+" "+unit+" "+this.checkDataRange(phy,csb.getMaxValue(),csb.getMinValue()));
			}
		}
	}


	/**
	 * 从can信息矩阵中获取指定长度的二进制字符串
	 * @param Bit32Str can信息矩阵的一维形式 高位->低位
	 * @param start 开始位
	 * @param length 长度
	 * @param type 0:Motorola 1:Intel
	 * @return 
	 */
	private String matrixSubBinStr(String bitStr,int start,int length,int type){
		String bitSubStr="";
		int strLength=bitStr.length();
		if(type==0){
			int tempIndex=this.getIndexOf(start);
			bitSubStr=bitStr.substring(tempIndex,tempIndex+length);
		}else{
			bitSubStr=bitStr.substring(strLength-start-length,strLength-start);
		}
		return bitSubStr;

	}
	/**
	 * 从全局静态数组byteIndexArray中查找元素
	 * @param num 要查找的元素
	 * @return 找到返回索引下标,没有找到该元素返回-1
	 */
	private int getIndexOf(int num){
		for(int i=0;i<64;i++){
			if(byteIndexArray[i]==num)
				return i;
		}
		return -1;
	}
	/**
	 * 判断物理值数据是否符合范围
	 * @param data 要判断的数据
	 * @param max 最大值
	 * @param min 最小值
	 * @return 判断信息 high:过高 low:过低 normal:正常
	 */
	private String checkDataRange(double data,double max,double min){
		String message="";
		if(data>max){
			message="high";
		}else if(data<min){
			message="low";
		}else{
			message="normal";
		}
		return message;
	}

}
