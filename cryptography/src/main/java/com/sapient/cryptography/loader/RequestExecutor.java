package com.sapient.cryptography.loader;

import java.util.Scanner;
import java.util.logging.Logger;

import com.sapient.cryptography.DecoderFactory;
import com.sapient.cryptography.EncoderFactory;

public class RequestExecutor {
	
	public static Logger  log = Logger.getLogger("RequestExecutor.class") ;
	
	public static boolean   execute() throws Exception  {
		
		Scanner it  =  new Scanner(System.in);
		 System.out.println("Select the version of framework to Encode & Decode");  
		String versionOfFrameWork = it.next();
		
		System.out.println("Kindly enter input String");  
		String inputString = it.next();
		
		System.out.println("your want to encode  Y or N");  
		
		String encodeFlag = it.next();
		
	     System.out.println("your want to decode  Y or N");  
		
		String decodeFlag = it.next();
		it.close();
		RunTimeJarLoader.loadJarFromPath(versionOfFrameWork);
		if(encodeFlag.equalsIgnoreCase("Y")) {
			String encodeStr = EncoderFactory.getEncoder("default").encode(inputString.getBytes());
			log.info("encodeMessage:::::"+encodeStr);
			System.out.println("encodeMessage:::::"+encodeStr);
		}
		if(decodeFlag.equalsIgnoreCase("Y")) {
			byte  [] decodeStr = DecoderFactory.getDecoder("default").decode(inputString) ;
			log.info("decoded:::::"+decodeStr);
			System.out.println("decoded:::::"+decodeStr);
		}
		return true;
	}

}
