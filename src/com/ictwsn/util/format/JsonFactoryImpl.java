package com.ictwsn.util.format;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
		String xmlStr = null;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		try {
			builder = factory.newDocumentBuilder();

			Document document = builder.newDocument();
			document.setXmlVersion("1.0");

			Element root = document.createElement("root");
			document.appendChild(root);

			Iterator<String> iter = canDatabaseMap.keySet().iterator();
			String key="";
			while (iter.hasNext()) {
				key = iter.next();
				Element message = document.createElement("canMessage");
				message.setAttribute("value",key);
				for(String value:canDatabaseMap.get(key)){
					Element signal = document.createElement("canSignal");
					signal.setAttribute("value",value.replaceAll("\"","#"));
					message.appendChild(signal);
				}
				root.appendChild(message);
			}

			TransformerFactory transFactory = TransformerFactory.newInstance();
			Transformer transFormer = transFactory.newTransformer();
			DOMSource domSource = new DOMSource(document);

			//export string
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			transFormer.transform(domSource, new StreamResult(bos));
			xmlStr = bos.toString();
			xmlStr=xmlStr.replaceAll("\"","'");
			xmlStr=xmlStr.replaceAll("#","\"");
			System.out.println(xmlStr);
			String path = JsonFactoryImpl.class.getClassLoader().getResource("")
					+ "userFiles/export/exportDataBase.xml";
			path = path.substring(6);
			path = path.replaceAll("WEB-INF/classes/", "");

			path = path.replaceAll("%20", " ");
			File file = new File(path);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream out = new FileOutputStream(file);
			byte[] contentInBytes = xmlStr.getBytes();

			out.write(contentInBytes);
			out.flush();
			out.close();
		}catch (ParserConfigurationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return false;
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Map<String,ArrayList<String>> importFile(String fileName) {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		Map<String,ArrayList<String>> canDatabaseMap=new HashMap<String,ArrayList<String>>();

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
		
		return canDatabaseMap;
	}
}
