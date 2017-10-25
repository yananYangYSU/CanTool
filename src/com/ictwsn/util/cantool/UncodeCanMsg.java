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
	
	private static UncodeCanMsg uncodeCanMsg=null;  //CurrentConn类单例对象

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
	 * @return CanPhyDataBean实体 例如该条信息为:CDU_HVACACCfg 25.0  ℃ 
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
		
		//String dataStr="1111111122222222111101010101001100100011100001110110010110101011";
		UncodeCanMsg t=new UncodeCanMsg();
		t.parseCanData(t.splitDataStr("t35880100003F000C0000"));
	
	}



	/**
	 * can信息字符串的切割提取
	 * @param dataStr "T127FFFFF800111213141516170000\r"或者"t127800111213141516170000\r"
	 * \r为换行符,不要用\\r
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
				for(int i=0;i<(dcl<<1);i=i+2){
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
				for(int i=0;i<(dcl<<1);i=i+2){
					dataList.add(data.substring(i,i+2));
				}
				cd.setData(dataList);
				if((dcl<<1)+14==dataStr.length()){
					String interval=dataStr.substring((dcl<<1)+10,(dcl<<1)+14); 
					cd.setInterval(interval);
				}
			}else{
				System.err.print("can信息格式不以t/T开头");
				cd.setDcl(-1);
			}
		}catch(Exception e){
			System.err.print("can信息格式不正确,无法解析");
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
		ArrayList<CanPhyDataBean> cpdbList=new ArrayList<CanPhyDataBean>();
		if(cd.getDcl()==-1){ //can信息格式不正确,无法解析
			return cpdbList;
		}
		DataFormats dataFormat=DataFormats.getInstance();
		int id=Integer.parseInt(cd.getId(),16);
		ArrayList<CanSignalBean> canSignalList=LoadDataBase.getCanSignalMap().get(id);
		
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
			return null;
		}else{
			//StringBuffer BitStrIntel=new StringBuffer();
			StringBuffer BitStrMatrix=new StringBuffer();
			int dataSize=cd.getData().size();
			/**
			 * intel can二进制矩阵字符串
			 */
			//for(int i=dataSize-1;i>=0;i--){
			//	BitStrIntel.append(dataFormat.hexToBinary(cd.getData().get(i)));
			//}
			/**
			 * BitStrMatrix can二进制矩阵字符串 76543210 76543210...
			 */
			for(int i=0;i<dataSize;i++){
				BitStrMatrix.append(dataFormat.hexToBinary(cd.getData().get(i)));
			}
			/**
			 * 遍历相同id下的信号数据库信息,把can信息从can矩阵中提取解析出来
			 */
			for(CanSignalBean csb:canSignalList){
				CanPhyDataBean cpdb=new CanPhyDataBean();
				cpdb.setSignalName(csb.getSignalName());
				
				String matrixSubBinStr=this.matrixSubBinStr(BitStrMatrix.toString(),csb.getStartBit(),csb.getBitLength(),csb.getBitType());
				
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
		//int strLength=bitStr.length();
		if(type==0){
			bitSubStr=this.subStrMotorolaBin(bitStr,start,length);//调用专门的Motorola字符串截取函数
		}else{
			bitSubStr=this.subStrIntelBin(bitStr,start,length);//intel使用subString即可
		}
		return bitSubStr;
	}
	/**
	 * 从全局静态数组byteIndexArray中查找元素
	 * @param num 要查找的元素
	 * @return 找到返回索引下标,没有找到该元素返回-1
	 */
	/*private int getIndexOf(int num){
		for(int i=0;i<64;i++){
			if(byteIndexMatrix[i]==num)
				return i;
		}
		return -1;
	}*/
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

	/**
	 * 进行Motorola格式二进制字符串的截取
	 * @param motorolaStr 二进制数据字符串(0-64)
	 * @param start 起始位
	 * @param length 长度
	 * @return 截取后的字符串 1001010
	 */
	private String subStrMotorolaBin(String motorolaStr,int start,int length){
		StringBuffer result=new StringBuffer(); //结果字符串
		ArrayList<String> strList=new ArrayList<String>();//
		int size=motorolaStr.length()>>3; //can信息字符串的数据长度 (0-64)
		for(int i=0;i<size;i++){
			strList.add(motorolaStr.substring(i<<3,(i<<3)+8));
		}
		int startRowIndex=start>>3;//起止位所在的行 (0-7)
		int curRowRightLen=start%8+1;//这个字符及它右侧总共的字符数+1代表算上自身 (1-8)
		if(curRowRightLen>=length){
			result.append(strList.get(startRowIndex).substring(8-curRowRightLen,8-curRowRightLen+length));
		}else{
			result.append(strList.get(startRowIndex).substring(8-curRowRightLen,8));
			int anotherRows=(length-curRowRightLen)>>3; //计算还需要几整行的数据
			int remainder=(length-curRowRightLen)%8; //整除8后的余数
			for(int i=0;i<anotherRows;i++){
				result.append(strList.get(++startRowIndex));
			}
			if(remainder!=0){
				result.append(strList.get(++startRowIndex).substring(8-remainder,8));
			}
		}
		return result.toString();
	}
	/**
	 * 进行Motorola格式二进制字符串的截取
	 * @param motorolaStr 二进制数据字符串(0-64)
	 * @param start 起始位
	 * @param length 长度
	 * @return 截取后的字符串 01010010
	 */
	private String subStrIntelBin(String IntelStr,int start,int length){
	    StringBuffer result=new StringBuffer();
		ArrayList<String> resultList=new ArrayList<String>(); //结果字符串数组
		ArrayList<String> strList=new ArrayList<String>();//
		int size=IntelStr.length()>>3; //can信息字符串的数据长度 (0-64)
		for(int i=0;i<size;i++){
			strList.add(IntelStr.substring(i<<3,(i<<3)+8));
		}
		int startRowIndex=start>>3;//起止位所在的行 (0-7)
		int curRowLeftLen=8-start%8;//这个字符及它左侧总共的字符数代表算上自身 (1-8)
		if(curRowLeftLen>=length){
			resultList.add(strList.get(startRowIndex).substring(curRowLeftLen-length,curRowLeftLen));
		}else{
			resultList.add(strList.get(startRowIndex).substring(0,curRowLeftLen));
			int anotherRows=(length-curRowLeftLen)>>3; //计算还需要几整行的数据
			int remainder=(length-curRowLeftLen)%8; //整除8后的余数
			for(int i=0;i<anotherRows;i++){
				resultList.add(strList.get(++startRowIndex));
			}
			if(remainder!=0){
				resultList.add(strList.get(++startRowIndex).substring(0,remainder));
			}
		}
		for(int i=resultList.size()-1;i>=0;i--) //intel倒序规则拼接字符串
			result.append(resultList.get(i));
		return result.toString();
	}
	
}
