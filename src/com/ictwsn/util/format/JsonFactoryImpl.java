package com.ictwsn.util.format;


import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;



public class JsonFactoryImpl implements DataBaseFactory{

	private static JsonFactoryImpl exportXML;  //CurrentConn类单例对象

	private JsonFactoryImpl(){}

	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static JsonFactoryImpl getInstance() {
		if (exportXML == null) {  
			exportXML = new JsonFactoryImpl();
		}  
		return exportXML;
	}

	@Override
	public boolean exportFile(Map<String, ArrayList<String>> canDatabaseMap){
		try {
			String jsonStr=JSONArray.fromObject(canDatabaseMap).toString();
			System.out.println(jsonStr);
			String path = JsonFactoryImpl.class.getClassLoader().getResource("")
					+ "userFiles/export/exportDataBase.json";
			path = path.substring(6);
			path = path.replaceAll("WEB-INF/classes/", "");

			path = path.replaceAll("%20", " ");
			File file = new File(path);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream out = new FileOutputStream(file);
			byte[] contentInBytes = jsonStr.getBytes();

			out.write(contentInBytes);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public static void main(String[] args){
		new JsonFactoryImpl().importFile("");
	}
	@Override
	public Map<String,ArrayList<String>> importFile(String fileName) {
		try{
			BufferedReader brname = new BufferedReader(new FileReader("F:\\exportDataBase.json"));// 读取NAMEID对应值  
			String sname = null;  
			while ((sname = brname.readLine()) != null) {  
				JSONArray jsonarray = JSONArray.fromObject(sname);
				JSONObject jo=JSONObject.fromObject(jsonarray.get(0));
				@SuppressWarnings("unchecked")
				Iterator<String> iter = jo.keySet().iterator();
				String key="";
				while (iter.hasNext()) {
					key = iter.next();
					System.out.println("----"+key+"----");
					JSONArray jo2=JSONArray.fromObject(jo.get(key));
					for(int i=0;i<jo2.size();i++)
						System.out.println(jo2.get(i));
				}
			
				//for(int i=0;i<jo.size();i++)
					
			}  
			brname.close();  
		} catch (IOException e1) {  
			// TODO Auto-generated catch block  
			e1.printStackTrace();  
		}  
		

		/*
		try {
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc=builder.parse(new FileInputStream(new File(fileName)));

			Element root=doc.getDocumentElement(); // 
			NodeList messages=root.getElementsByTagName("CanMassage");
			System.out.println(messages.getLength());
			for (int i=0;i<messages.getLength();i++){
				Element msg = (Element) messages.item(i);
				NodeList signals = msg.getElementsByTagName("CanSignal");
				ArrayList<String> signalList = new ArrayList<String>();
				for(int j=0;j<signals.getLength();j++){
					Element sig = (Element) signals.item(j);
					signalList.add(sig.getAttribute("value"));
					System.out.println(sig.getAttribute("value"));
				}
				canDatabaseMap.put(msg.getAttribute("value"),signalList);
			}
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 */
		return null;
	}
}
