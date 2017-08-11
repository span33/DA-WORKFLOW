package com.sapient.cryptography;

import java.util.Base64;

public class CustomDecoder implements Decoder {

	public byte[] decode(String encoded) {
		return Base64.getDecoder().decode(encoded) ;
	}

}
