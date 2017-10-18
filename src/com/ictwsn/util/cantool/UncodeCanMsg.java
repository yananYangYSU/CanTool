package com.ictwsn.util.cantool;

import java.util.ArrayList;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.util.format.DataFormats;
import com.ictwsn.util.format.DateFormats;
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
		63,62,61,60,59,58,57,56
	};

	private static UncodeCanMsg uncodeCanMsg = null;  //CurrentConn类单例对象

	private UncodeCanMsg(){}

	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static UncodeCanMsg getInstance() {
		if (uncodeCanMsg == null) {  
			uncodeCanMsg = new UncodeCanMsg();
		}  
		return uncodeCanMsg;
	}

	/**
	 * 根据can信息字符串和信号名称解析得到对应的物理信息实体
	 * @param signalName 信号名称
	 * @param canMsgStr can信息字符串
	 * @return CanPhyDataBean实体 例如该条信息为:CDU_HVACACCfg 2185.0 ℃ high
	 */
	public CanPhyDataBean getCanPhyData(String signalName,String canMsgStr){
		ArrayList<CanPhyDataBean> cpdbList=this.parseCanData(this.splitDataStr(canMsgStr));
		for(CanPhyDataBean cpdb:cpdbList){
			if(cpdb.getSignalName().equals(signalName)){
				return cpdb;
			}
		}
		return null;
	} 
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		/*DataFormats dataFormat=DataFormats.getInstance();
		// TODO Auto-generated method stub
		 * t32186211F553238765AB//
		 */
		String dataStr="t32186211F553238765AB\r";
		UncodeCanMsg t=new UncodeCanMsg();
		System.out.println("message="+dataStr);
		System.out.println("解析后id:"+Integer.parseInt("321",16));
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
			BitStrIntel.append(DataFormats.getInstance().hexToBinary(dataList.get(i)));
		}
		System.out.println("----intel matrix-----");

		for(int i=0;i<size;i++){
			System.out.println(DataFormats.getInstance().hexToBinary(dataList.get(i)));
		}
		System.out.println("intel "+BitStrIntel);
	
		System.out.println(t.matrixSubBinStr(BitStrIntel.toString(), 15, 8, 0));
		System.out.println("----motorola-----");
		//motorola

		//	for(int i=size-1;i>=0;i--){
		for(int i=0;i<size;i++){
			BitStrMotorola.append(DataFormats.getInstance().hexToBinary(dataList.get(i)));	
		}/*if(flag==true){
				BitStrMotorola.append(t.hexToBinary(dataList.get(i)));
				flag=!flag;
			}else{
				BitStrMotorola.append(t.reverseStr(t.hexToBinary(dataList.get(i))));
				flag=!flag;
			}		*/	
		//}

		for(int i=0;i<size;i++){
			System.out.println(DataFormats.getInstance().hexToBinary(dataList.get(i)));

		}

		System.out.println("motol "+BitStrMotorola);

		System.out.println(t.matrixSubBinStr(BitStrIntel.toString(), 15, 8, 1));
		//System.out.println("motol ");
		//System.out.println(t.matrixSubBinStr(BitStrMotorola.toString(), 11, 12,0));
		 
	
	}



	/**
	 * can信息字符串的切割提取
	 * @param dataStr "T127FFFFF800111213141516170000\r"或者"t127800111213141516170000\r"
	 * \r为换行符,尽量不要用\\r
	 * @return CanData对象
	 */
	public CanMsgDataBean splitDataStr(String dataStr){
		CanMsgDataBean cd=new CanMsgDataBean();
		dataStr=dataStr.trim();
		//dataStr=dataStr.replace("\\r","");
		//dataStr=dataStr.replace("\r","");
		try{
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
				cd.setDcl(-1);
			}
		}catch(Exception e){
			cd.setDcl(-1);
		}
		cd.setTime(DateFormats.getInstance().getNowDate());//打上当前时间戳

		return cd;

	}
	/**
	 * canData对象信息解析
	 * @param cd
	 * @return 解析出物理属性的can信息实体数组
	 */
	public ArrayList<CanPhyDataBean> parseCanData(CanMsgDataBean cd){

		DataFormats dataFormat=DataFormats.getInstance();
		int id=Integer.parseInt(cd.getId(),16);
		ArrayList<CanSignalBean> canSignalList=LoadDataBase.getCanSignalMap().get(id);
		
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
			return null;
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
			ArrayList<CanPhyDataBean> cpdbList=new ArrayList<CanPhyDataBean>();
			for(CanSignalBean csb:canSignalList){
				CanPhyDataBean cpdb=new CanPhyDataBean();

				cpdb.setSignalName(csb.getSignalName());

				String matrixSubBinStr="";
				if(csb.getBitType()==0){//0代表Motorola格式
					matrixSubBinStr=this.matrixSubBinStr(BitStrMotorola.toString(),csb.getStartBit(),csb.getBitLength(),0);
				}else{//1代表intel格式
					matrixSubBinStr=this.matrixSubBinStr(BitStrIntel.toString(),csb.getStartBit(),csb.getBitLength(),1);
				}
				double x=Integer.parseInt(matrixSubBinStr,2);
				double phy=x*csb.getResolutionValue()+csb.getOffsetValue();
				cpdb.setPhyValue(phy);
				cpdb.setUnit(csb.getUnit());
				cpdb.setBinaryStr(matrixSubBinStr);//2进制串
				cpdb.setHexStr(Integer.toHexString(Integer.parseInt(matrixSubBinStr,2)));//2进制转成16进制
				cpdb.setTime(cd.getTime());
				cpdbList.add(cpdb);
			}
			return cpdbList;
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
	private boolean checkMessage(String messageStr){
		return false;
	}

}
