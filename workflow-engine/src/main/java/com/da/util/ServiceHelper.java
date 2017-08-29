package com.da.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.da.activiti.model.document.ProcessInfo;

public class ServiceHelper {
	
	public static List <String> convertCommaSepratedStringToList(String inputdata) {
		
		if(!StringUtils.isBlank(inputdata)) {

			List <String> retList = new ArrayList<String>();
			String [] dataArray = inputdata.split(",");
			for(String data : dataArray ) {
				retList.add(data);
			}
			
			return retList;
		}
		
		return null ;
		
		
	}
	
	public static String convertListToCommaSepratedString(List<String> inputdata) {
		if(inputdata != null && inputdata.size() >0 ) {
			StringBuilder builder = new StringBuilder() ;
			inputdata.forEach(index -> builder.append(index).append(",") );
			String retString = builder.toString() ;
			retString = retString.substring(0 ,retString.length() - 1) ;
			return retString;
		}
	 return StringUtils.EMPTY ;
		
	}
	
	public  static boolean validateProcessInfo(ProcessInfo processInfo) {
		
		if(processInfo.getSubProcessList()!= null &&  processInfo.getSubProcessList().size() > 0) {
			return true;
		}
		return false ;
	}

}
