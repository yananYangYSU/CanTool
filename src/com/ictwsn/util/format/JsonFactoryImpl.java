package com.ictwsn.util.format;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

	@Override
	public Map<String,ArrayList<String>> importFile(String fileName) {
		Map<String,ArrayList<String>> canDatabaseMap=new HashMap<String,ArrayList<String>>();
		try{
			String path = XmlFactoryImpl.class.getClassLoader().getResource("")
					+ "userFiles/import/"+fileName;
			path = path.substring(6);
			path = path.replaceAll("WEB-INF/classes/", "");
			path = path.replaceAll("%20", " ");
			BufferedReader brname = new BufferedReader(new FileReader(path));// 读取NAMEID对应值  
			String sname = null;  
			while ((sname = brname.readLine()) != null) {  
				JSONArray jsonarray = JSONArray.fromObject(sname);
				JSONObject jo=JSONObject.fromObject(jsonarray.get(0));
				@SuppressWarnings("unchecked")
				Iterator<String> iter = jo.keySet().iterator();
				String key="";
				while (iter.hasNext()) {
					key = iter.next();
					ArrayList<String> signalList = new ArrayList<String>();
					JSONArray jo2=JSONArray.fromObject(jo.get(key));
					for(int i=0;i<jo2.size();i++){
						signalList.add(jo2.get(i).toString());
					}
					canDatabaseMap.put(key,signalList);
				}	
			}  
			brname.close();  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  
		return canDatabaseMap;
	}
}
