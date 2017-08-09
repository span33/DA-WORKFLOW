package com.da.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

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

}
