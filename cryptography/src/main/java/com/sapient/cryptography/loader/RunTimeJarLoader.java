package com.sapient.cryptography.loader;

import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

public class RunTimeJarLoader {
	
	public static final String basePath = "D:/DataAnalyticsProject/workspace/cryptography/target" ;

	public static void loadJarFromPath(String versionName)  {

		JarFile jarFile = null;
		try {
			jarFile = new JarFile(basePath+ "/" +versionName);

			Enumeration<JarEntry> e = jarFile.entries();

			URL[] urls = { new URL("jar:file:" + versionName + "!/") };
			URLClassLoader cl = URLClassLoader.newInstance(urls);

			while (e.hasMoreElements()) {
				JarEntry je = e.nextElement();
				if (je.isDirectory() || !je.getName().endsWith(".class")) {
					continue;
				}
				// -6 because of .class
				String className = je.getName().substring(0, je.getName().length() - 6);
				className = className.replace('/', '.');
				Class c = cl.loadClass(className);

			}
			jarFile.close();
		} catch (IOException e1  ) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}catch(ClassNotFoundException exp) {
			
		}finally {
			if(jarFile!= null) {
				try {
					jarFile.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
