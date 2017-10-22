<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	//   设置响应头和下载路径、保存的文件名    
	//response.reset();  
 	response.setContentType("application/x-msdownload");  
 	response.addHeader("Content-Disposition","attachment;filename=\"" + "exportDataBase.json" + "\"");
 
        FileInputStream fis = new FileInputStream(request.getRealPath("/")+"userFiles/export/exportDataBase.json");
        OutputStream os = response.getOutputStream();
         
        int i = -1;
        byte[] b = new byte[1024];
         
        while((i = fis.read(b, 0, 1024)) != -1)
        {
            os.write(b, 0, i);
        }
         
        fis.close();
        os.close();
        out.clear();
		out = pageContext.pushBody();
 	
 	//response.setContentType("APPLICATION/OCTET-STREAM");
	//System.out.println(basePath+"userFiles/export/exportDataBase.xml");
	//response.sendRedirect(basePath+"userFiles/export/exportDataBase.xml");
%>


