package com.ictwsn.util.cantool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.util.format.DataFormats;

/**
 * can信息编码类
 * @author YangYanan
 * @desc 对cantool装置发送到cantoolApp的字符串信息解析
 * @date 2017-10-05
 */
public class CodeCanMsg {
	private final static int[][] byteIndexMatrix={
		{7,6,5,4,3,2,1,0},
		{15,14,13,12,11,10,9,8},
		{23,22,21,20,19,18,17,16},
		{31,30,29,28,27,26,25,24},
		{39,38,37,36,35,34,33,32},
		{47,46,45,44,43,42,41,40},
		{55,54,53,52,51,50,49,48},
		{63,62,61,60,59,58,57,56}
	};

	private static CodeCanMsg uncodeCanMsg=null;  //CurrentConn类单例对象

	private CodeCanMsg(){}

	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static CodeCanMsg getInstance() {
		if (uncodeCanMsg == null) {  
			uncodeCanMsg = new CodeCanMsg();
		}  
		return uncodeCanMsg;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		/*DataFormats dataFormat=DataFormats.getInstance();
		// TODO Auto-generated method stub
		 * t32186211F553238765AB//
		 */
		Map<String,Double> sigNamePhyMap =new HashMap<String,Double>();
		sigNamePhyMap.put("HVAC_ACPCommand",2.0);
		sigNamePhyMap.put("HVAC_ACPSpeedSet",4300.0);
		sigNamePhyMap.put("HVAC_Checksum",195.0);
		//String dataStr="1111111122222222111101010101001100100011100001110110010110101011";
		CodeCanMsg t=new CodeCanMsg();
		System.out.print(t.getMessageStr(864,8,sigNamePhyMap));
		//System.out.println(t.subStrIntel(12, 12));
		//System.out.println("解析后id:"+Integer.parseInt("321",16));
		//System.out.println(	t.indexStrProcess(t.parseCanData(UncodeCanMsg.getInstance().splitDataStr("t32186211F553238765AB"))));
		/*Pattern p=Pattern.compile("[a-]{1,}@[0-9]{1}",Pattern.DOTALL);
		Matcher m=p.matcher("SG_ CDU_HVACAutoModeButtonSt : 2|00001@0+ (1,0) [0|1] \"\"  HVAC");
		while(m.find()){
			System.out.println(m.group());
		}*/

		//		ArrayList<String> dataList=t.splitDataStr(dataStr).getData();
		//		StringBuffer BitStrIntel=new StringBuffer();
		//		StringBuffer BitStrMotorola=new StringBuffer();
		//
		//		int size=dataList.size();
		//		//intel
		//		for(int i=size-1;i>=0;i--){
		//			BitStrIntel.append(DataFormats.getInstance().hexToBinary(dataList.get(i)));
		//		}
		//		System.out.println("----intel matrix-----");
		//
		//		for(int i=0;i<size;i++){
		//			System.out.println(DataFormats.getInstance().hexToBinary(dataList.get(i)));
		//		}
		//		System.out.println("intel "+BitStrIntel);
		//	
		//		System.out.println(t.matrixSubBinStr(BitStrIntel.toString(), 15, 8, 0));
		//		System.out.println("----motorola-----");
		//		//motorola
		//		for(int i=0;i<size;i++){
		//			BitStrMotorola.append(DataFormats.getInstance().hexToBinary(dataList.get(i)));	
		//		}
		//
		//		for(int i=0;i<size;i++){
		//			System.out.println(DataFormats.getInstance().hexToBinary(dataList.get(i)));
		//
		//		}
		//
		//		System.out.println("motol "+BitStrMotorola);
		//		System.out.println(t.matrixSubBinStr(BitStrIntel.toString(), 15, 8, 1));


	}
	/**
	 * 由can信息字符串转换成矩阵分布图的字符串
	 * @param messageStr "t32186211F553238765AB\r"
	 * @return [[7,7,50],[3,5,0],[0,5,0],[1,5,0]...]
	 */
	/**
	 * 根据用户输入的canMessage的id,dcl,信号名称及物理值来编码生成对应的can信息字符串
	 * @param id 801
	 * @param dcl 8
	 * @param sigNamePhyMap 如下：
	 *   key                         value
	 *  "HVAC_AAAAAAAAAAAAA1q"       50.0
		"HVAC_CorrectedCabinTempVD"  1.0
	 * @return "t3938000000003B000000"
	 */
	public String getMessageStr(int id,int dcl,Map<String,Double> sigNamePhyMap){
		Map<String,String> sigNameIndexMap=this.getSigNameIndexMap(id);//信号名称和它所占矩阵下标(高位->地位)的map数组
		DataFormats dataFormat=DataFormats.getInstance();
		/**
		 * 获取对应id的canSignal列表
		 */
		ArrayList<CanSignalBean> canSignalList=LoadDataBase.getCanSignalMap().get(id);
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
			return "-3";
		}
		/**
		 * 初始化矩阵数组matrixBinList,所有位全部置0,数组长度为dcl乘以8
		 * 这里从最高位到最低位,以1维数组形式排列
		 */
		int totalBitLength=dcl<<3;
		Map<Integer,String> matrixBinListMap=new HashMap<Integer,String>();
		for(int i=totalBitLength-1;i>=0;i--){
			matrixBinListMap.put(i,"0");
		}
		/**
		 * 遍历手工输入的信号及物理值,进行物理值->二进制字符串的转换操作
		 */
		Iterator<String> iter = sigNamePhyMap.keySet().iterator();
		String key="";
		while (iter.hasNext()) {
			key = iter.next();
			CanSignalBean csb=this.findCanSignalBean(canSignalList,key);
			if(csb.getSignalName()==null){
				System.err.println(key+" 找不到对应的实体类 ");
				return "-2";
			}
			double phy=sigNamePhyMap.get(key);
			if(phy<csb.getMinPhyValue()||phy>csb.getMaxPhyValue()){
				System.err.println("物理值不在范围 信号名称:"+ key+"物理值: "+phy+" ("+csb.getMaxPhyValue()+" "+csb.getMaxPhyValue()+")");
				return "-1";
			}
			System.out.println("phy: "+phy+" A: "+csb.getResolutionValue()+" B: "+csb.getOffsetValue());
			int x=(int) ((phy-csb.getOffsetValue())/csb.getResolutionValue());
			System.out.println("x "+x);
			String binStr=dataFormat.decimalToBinary(x,csb.getBitLength());
			String indexStr=sigNameIndexMap.get(key);
			System.out.println(binStr);
			System.out.println(indexStr);
			String[] binStrList=binStr.split("");
			String[] indexStrList=indexStr.split(",");
			/**
			 * 进行矩阵的一维数组填充
			 */ 
			for(int i=0;i<csb.getBitLength();i++){
				matrixBinListMap.put(Integer.parseInt(indexStrList[i]),binStrList[i+1]);
			}
		}

		/**
		 * 矩阵的一维数组拼接成字符串,最多64位长度
		 */
		StringBuffer resultStr=new StringBuffer();
		for(int i=totalBitLength-1;i>=0;i--){ 
			resultStr.append(matrixBinListMap.get(i));
		}
		/**
		 * 把二进制字符串转换成16进制字符串
		 */
		String binStr=dataFormat.reverseStr(resultStr.toString());//倒置
		resultStr.setLength(0);
		for(int i=0;i<dcl;i++){
			resultStr.append(dataFormat.binaryToHex(binStr.substring(i<<3,(i<<3)+8)));
		}
		String hexId=dataFormat.decimalToHex(id);
		if(hexId.length()==3){
			return "t"+hexId+dcl+resultStr.toString().toUpperCase();
		}else{
			return "T"+hexId+dcl+resultStr.toString().toUpperCase();
		}
	}

	/**
	 * 根据can信号名称找到它对应的实体类,包含名称、类型、开始位、长度、A、B、C、D等信息
	 * @param canSignalList can信号实体类数组
	 * @param canSignalName can信号名称
	 * @return 对应的实体类 找不到返回空
	 */
	private CanSignalBean findCanSignalBean(ArrayList<CanSignalBean> canSignalList,String canSignalName){
		CanSignalBean csbBean=new CanSignalBean();
		for(CanSignalBean csb:canSignalList){
			if(canSignalName!=null&&canSignalName.equals(csb.getSignalName())){
				csbBean=csb;break;
			}
		}
		return csbBean;
	}
	/**
	 * 根据id得到它所包含的信号名称及所占的矩阵索引
	 * @param id 801
	 * @return 以信号名称为key,所占索引字符串为value的map数组
	 * 如下所示：
	 * key                         value
	 * HVAC_CompressorComsumpPwr 17,16,31,30,29,28,27,26,25,24,37,36,35,34,33,32,
	 * HVAC_AAAAAAAAAAAAA        4,3,2,1,0,10,9,8,
	 * HVAC_CorrectedCabinTempVD 18,17,16,28,27,26,25,24,
	 * HVAC_PTCPwrAct            33,32,47,46,45,44,43,42,41,40,
	 * HVAC_RawCabinTemp         7,6,5,4,3,2,1,0,
	 * HVAC_RawCabinTempVD       19,
	 * HVAC_stPTCAct             55,54,53,
	 */
	private Map<String,String> getSigNameIndexMap(int id){
		Map<String,String> sigNameIndexMap=new HashMap<String,String>();

		ArrayList<CanSignalBean> canSignalList=LoadDataBase.getCanSignalMap().get(id);
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
			return sigNameIndexMap;
		}
		/**
		 * 遍历相同id下的信号数据库信息,把can信息从can矩阵中提取解析出来
		 */
		String matrixIndexStr="";
		for(CanSignalBean csb:canSignalList){
			if(csb.getBitType()==0){
				matrixIndexStr=this.subStrMotorolaIndex(csb.getStartBit(),csb.getBitLength());//调用专门的Motorola字符串截取函数
			}else{
				matrixIndexStr=this.subStrIntelIndex(csb.getStartBit(),csb.getBitLength());//调用专门的Intel字符串截取函数
			}
			sigNameIndexMap.put(csb.getSignalName(),matrixIndexStr); 
		}
		return sigNameIndexMap;


	}

	/**
	 * 进行Motorola格式索引字符串的截取,用于生成heatmap的矩阵,右对齐
	 * @param start 起始位
	 * @param length 长度
	 * @return 截取后的字符串 "17,16,31,30,29,28,27,26,25,24,"
	 */
	private String subStrMotorolaIndex(int start,int length){
		StringBuffer result=new StringBuffer(); //结果字符串
		int startRowIndex=start>>3;  //起止位所在的行 (0-7)
			int curRowRightLen=start%8+1;//这个字符及它右侧总共的字符数+1代表算上自身 (1-8)
			if(curRowRightLen>=length){
				result.append(this.subStringIndex(byteIndexMatrix[startRowIndex],8-curRowRightLen,8-curRowRightLen+length));
			}else{
				result.append(this.subStringIndex(byteIndexMatrix[startRowIndex],8-curRowRightLen,8));
				int anotherRows=(length-curRowRightLen)>>3; //计算还需要几整行的数据
			int remainder=(length-curRowRightLen)%8;    //整除8后的余数
			for(int i=0;i<anotherRows;i++){
				result.append(this.subStringIndex(byteIndexMatrix[++startRowIndex],0,8));
			}
			if(remainder!=0){
				result.append(this.subStringIndex(byteIndexMatrix[++startRowIndex],8-remainder,8));
			}
			}
			return result.toString();
	}
	/**
	 * 进行intel格式索引字符串的截取,用于生成heatmap的矩阵,左对齐
	 * @param start 起始位
	 * @param length 长度
	 * @return 截取后的字符串 "39,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,"
	 */
	private String subStrIntelIndex(int start,int length){
		StringBuffer result=new StringBuffer();
		ArrayList<String> resultList=new ArrayList<String>(); //结果字符串数组0
		int startRowIndex=start>>3;//起止位所在的行 (0-7)
			int curRowLeftLen=8-start%8;//这个字符及它左侧总共的字符数代表算上自身 (1-8)
			if(curRowLeftLen>=length){
				resultList.add(this.subStringIndex(byteIndexMatrix[startRowIndex],curRowLeftLen-length,curRowLeftLen));
			}else{
				resultList.add(this.subStringIndex(byteIndexMatrix[startRowIndex],0,curRowLeftLen));
				int anotherRows=(length-curRowLeftLen)>>3; //计算还需要几整行的数据
				int remainder=(length-curRowLeftLen)%8; //整除8后的余数
				for(int i=0;i<anotherRows;i++){
					resultList.add(this.subStringIndex(byteIndexMatrix[++startRowIndex],0,8));
				}
				if(remainder!=0){
					resultList.add(this.subStringIndex(byteIndexMatrix[++startRowIndex],0,remainder));
				}
			}
			for(int i=resultList.size()-1;i>=0;i--)
				result.append(resultList.get(i));
			return result.toString();
	}

	/**
	 * 自定义索引截取函数,被subStrMotorolaIndex和subStrIntelIndex两个方法调用
	 * @param row 行号
	 * @param start 开始位
	 * @param length 长度
	 * @return "17,16,"
	 */
	private String subStringIndex(int[] row,int start,int length){
		StringBuffer result=new StringBuffer();
		for(int i=start;i<length;i++){
			result.append(row[i]).append(",");
		}
		return result.toString();
	}
}
