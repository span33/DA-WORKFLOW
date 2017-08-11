package com.sapient.cryptography;

public class DecoderFactory {
	
	public static Decoder  getDecoder(String decoderProvider) {
		Decoder decoder = null ;
		if(decoderProvider.equals("default")) {
			decoder = new CustomDecoder();
		}
		
		return  decoder;
	}

}
