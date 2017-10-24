package com.ictwsn.util.cantool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.ictwsn.bean.CanMegParseBean;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanMsgFabricBean;
import com.ictwsn.bean.CanSignalBean;

/**
 * can信息解码类
 * @author YangYanan
 * @desc 对cantool装置发送到cantoolApp的字符串信息解析
 * @date 2017-10-05
 */
public class UncodeCanMsgForMatrix {
	private final static int[][] byteIndexMatrix={
		{7,6,5,4,3,2,1,0},
		{15,14,13,12,11,10,9,8},
		{23,22,21,20,19,18,17,16},
		{31,30,29,28,27,26,25,24},
		{39,28,37,36,35,34,33,32},
		{47,46,45,44,43,42,41,40},
		{55,54,53,52,51,50,49,48},
		{63,62,61,60,59,58,57,56}
	};

	private static UncodeCanMsgForMatrix uncodeCanMsg=null;  //CurrentConn类单例对象

	private UncodeCanMsgForMatrix(){}

	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static UncodeCanMsgForMatrix getInstance() {
		if (uncodeCanMsg == null) {  
			uncodeCanMsg = new UncodeCanMsgForMatrix();
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

		//String dataStr="1111111122222222111101010101001100100011100001110110010110101011";
		UncodeCanMsgForMatrix t=new UncodeCanMsgForMatrix();
		t.parseCanData(UncodeCanMsg.getInstance().splitDataStr("t32186211F553238765AB"));
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
	public CanMsgFabricBean showMatrixTable(String messageStr){
		CanMsgFabricBean cmfb=new CanMsgFabricBean();
		ArrayList<CanMegParseBean> cmpdList=parseCanData(UncodeCanMsg.getInstance().splitDataStr(messageStr));
		cmfb.setCanMessage(messageStr);
		cmfb.setCmpbList(cmpdList);
		cmfb.setFabricNum(cmpdList.size());
		ArrayList<String> indexList=new ArrayList<String>();
		for(CanMegParseBean cmpb:cmpdList){
			indexList.add(cmpb.getIndexStr());
		}
		cmfb.setDataSeries(indexStrProcess(indexList));

		return cmfb;
	}


	/**
	 * canData对象信息解析
	 * @param cd
	 * @return 解析出物理属性的can信息实体数组
	 */
	private ArrayList<CanMegParseBean> parseCanData(CanMsgDataBean cd){
		ArrayList<CanMegParseBean> cmpbList=new ArrayList<CanMegParseBean>();

		int id=Integer.parseInt(cd.getId(),16);
		ArrayList<CanSignalBean> canSignalList=LoadDataBase.getCanSignalMap().get(id);
		if(canSignalList==null||canSignalList.size()==0){
			System.err.print("id:"+id+"找不到对应数据库信息");
			return cmpbList;
		}
		/**
		 * 遍历相同id下的信号数据库信息,把can信息从can矩阵中提取解析出来
		 */
		String matrixIndexStr="";
		for(CanSignalBean csb:canSignalList){
			CanMegParseBean cmpb=new CanMegParseBean();
			cmpb.setSignalName(csb.getSignalName());
			if(csb.getBitType()==0){
				cmpb.setBitType("Motorola");
				matrixIndexStr=this.subStrMotorolaIndex(csb.getStartBit(),csb.getBitLength());//调用专门的Motorola字符串截取函数
			}else{
				cmpb.setBitType("Intel");
				matrixIndexStr=this.subStrIntelIndex(csb.getStartBit(),csb.getBitLength());//intel使用subString即可
			}
			cmpb.setIndexStr(matrixIndexStr);
			cmpbList.add(cmpb);
		}
		return cmpbList;


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
	 * 自定义索引截取函数,被上面两个方法调用
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

	/**
	 * 加工heatMap字符串
	 * @param resultIndexList 结果索引数组
	 * @return [,[0, 0, 7], [0, 1, 19],[0, 1, 19]]
	 */
	private String indexStrProcess(ArrayList<String> resultIndexList){
		/**
		 * 初始化索引颜色map数组 默认0
		 */
		Map<Integer,String> indexColorMap=new HashMap<Integer,String>();
		StringBuffer index=new StringBuffer();
		for(int i=0;i<64;i++){
			index.setLength(0);
			indexColorMap.put(i,index.append(",[").append(7-i%8).append(",").append(7-i/8).append(",").append("0]").toString());
		}
		/**
		 * 开始替换色块,计算坐标和颜色等级
		 */
		StringBuffer resultStr=new StringBuffer();
		int colorLevel=0;
		for(String indexStr:resultIndexList){
			String[] row=indexStr.split(",");
			colorLevel++;
			for(int i=0;i<row.length;i++){
				int num=Integer.parseInt(row[i]);
				int x=7-num%8;
				int y=7-num/8;
				indexColorMap.remove(num);
				resultStr.setLength(0);
				indexColorMap.put(num,resultStr.append(",[").append(x).append(",").append(y).append(",").append(colorLevel).append("]").toString());
			}
		}
		/**
		 * 生成heatMap的dataSeries字符串
		 */
		Iterator<Integer> iter = indexColorMap.keySet().iterator();
		int key=0;
		resultStr.setLength(0);
		resultStr.append("[");
		while (iter.hasNext()) {
			key = iter.next();
			resultStr.append(indexColorMap.get(key));
		}
		resultStr.append("]");
		return resultStr.toString().replace("[,[","[[");
	}
}
