package com.ictwsn.util.format;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.ictwsn.bean.CanMessageBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.util.CurrentConn;

//数据库导入函数
public class ImportData {     
	public static void main(String args[]) {
		String flag = null;
		Connection conn=CurrentConn.getInstance().getConn(); //获取连接
		PreparedStatement pstmt=null;
		
		String data = "";
        try {
        	File file = new File("src/Data.txt");//得到一个指定文件
            InputStreamReader reader = new InputStreamReader(new FileInputStream(file));//建立一个输入流reader
            BufferedReader br = new BufferedReader(reader);//建立一个对象，把文件内容转成软件程序能读懂的语句      
            while((data=br.readLine())!=null) {
            	System.out.println(data);
            	Pattern pattern1 = Pattern.compile("(BO).\\s(\\d*)\\s(.*)\\:\\s(\\d)\\s(.*)");
                Matcher matcher1 = pattern1.matcher(data); 
                while (matcher1.find()) {
                	flag=matcher1.group(2);
                	//System.out.println(matcher1.group(2)+","+matcher1.group(3)+","+matcher1.group(4)+","+matcher1.group(5));
                	//System.out.println();
                	try {
            			String sql="insert into canmessage(id,messageName,dcl,nodeName)values(?,?,?,?)";
            			pstmt=conn.prepareStatement(sql);  
            			pstmt.setInt(1, Integer.parseInt(matcher1.group(2)));   //设置参数
            			pstmt.setString(2, matcher1.group(3));
            			pstmt.setString(3, matcher1.group(4));
            			pstmt.setString(4, matcher1.group(5));
            			pstmt.executeUpdate();
            		}catch(SQLException e) {
            			e.printStackTrace();
            		}
                }
                Pattern pattern2 = Pattern.compile("\\s(\\w*)\\s.\\s(\\d*).(\\d*).(.*).\\s.(.*)\\,(.*)\\)\\s\\[(.*)\\|(.*)\\]\\s\"(.*)\"\\s\\s(.*)");
            	Matcher matcher2=pattern2.matcher(data);
            	while(matcher2.find()) {
            		//System.out.print(flag+",");
            		//System.out.println(matcher2.group(1)+","+matcher2.group(2)+","+matcher2.group(3)+","+matcher2.group(4)+","+matcher2.group(5)+","+matcher2.group(6)+","+matcher2.group(7)+","+matcher2.group(8)+","+matcher2.group(9)+","+matcher2.group(10));
            		//System.out.println("");
            		
            		try {
            			String sql="insert into cansignal(messageId,signalName,startBit,bitLength,bitType,resolution,offsets,minValue,maxValues,unit,nodeNames)values(?,?,?,?,?,?,?,?,?,?,?)";
            			pstmt=conn.prepareStatement(sql);
            			pstmt.setInt(1, Integer.parseInt(flag));
            			pstmt.setString(2, matcher2.group(1));
            			pstmt.setInt(3, Integer.parseInt(matcher2.group(2)));
            			pstmt.setInt(4, Integer.parseInt(matcher2.group(3)));
            			pstmt.setInt(5, Integer.parseInt(matcher2.group(4)));
            			pstmt.setDouble(6, Double.parseDouble(matcher2.group(5)));
            			pstmt.setDouble(7, Double.parseDouble(matcher2.group(6)));
            			pstmt.setDouble(8, Double.parseDouble(matcher2.group(7)));
            			pstmt.setDouble(9, Double.parseDouble(matcher2.group(8)));
            			pstmt.setString(10, matcher2.group(9));
            			pstmt.setString(11, matcher2.group(10));	
            			pstmt.executeUpdate();
            		}catch(SQLException e) {
            			e.printStackTrace();
            		}
            	}
                
            }
            br.close();
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
}

