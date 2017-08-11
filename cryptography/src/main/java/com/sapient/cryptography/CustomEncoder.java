package com.sapient.cryptography;

import java.util.Base64;

public class CustomEncoder  implements Encoder {
	

	public String encode(byte[] binaryData) {
		// TODO Auto-generated method stub
		return Base64.getEncoder().encodeToString(binaryData);
	}

}
