package com.ictwsn.service.exportData;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
 
import com.ictwsn.dao.exportData.ExportDataDao;

 
@Service
public class ExportDataServiceImpl implements ExportDataService {
	
	@Resource ExportDataDao dao;

	@Override
	public boolean exportCSVData() {
		//第一步，创建一个webbook，对应一个Excel文件
		HSSFWorkbook wb=new HSSFWorkbook();
		//第二步，在webbook中添加一个sheet，对应Excel文件中的sheet
		HSSFSheet sheet=wb.createSheet("Can信息数据表");
		//第三步，在sheet中添加表头第0行
		HSSFRow row=sheet.createRow((int)0);
		//第四步，创建单元格，设置值表头，并设置表头居中
		HSSFCellStyle style=wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFCell cell=row.createCell(0);
		
		cell=row.createCell(0);
		cell.setCellValue("id");
		cell.setCellStyle(style);
		
		cell=row.createCell(1);
		cell.setCellValue("dcl");
		cell.setCellStyle(style);
		
		cell=row.createCell(2);
		cell.setCellValue("data");
		cell.setCellStyle(style);
		
		cell=row.createCell(3);
		cell.setCellValue("time");
		cell.setCellStyle(style);
		
		//第五步，写入实体数据，从数据库读取
		ArrayList<String> List=new ArrayList<String>();
		Map<Integer,ArrayList<String>> map=dao.getData();
		Set<Integer> set=map.keySet();
		for(int i=0;i<set.size();i++){
			List=map.get(i);
			row=sheet.createRow(i+1);
			row.createCell(0).setCellValue(List.get(0));
			row.createCell(1).setCellValue(List.get(1));
			row.createCell(2).setCellValue(List.get(2));
			row.createCell(3).setCellValue(List.get(3));
		}
		//第六步，将文件存到指定位置
		try {
			String path ="WEB-INF/classes/export/form.xls";
			FileOutputStream fout = new FileOutputStream(path);
			wb.write(fout);
			fout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	


}
