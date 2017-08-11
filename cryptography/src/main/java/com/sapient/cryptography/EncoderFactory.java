package com.sapient.cryptography;

public class EncoderFactory {

	public static Encoder getEncoder(String encoderProvider) {
		Encoder encoder = null;
		if (encoderProvider.equals("default")) {
			encoder = new CustomEncoder();
		}

		return encoder;

	}
}
