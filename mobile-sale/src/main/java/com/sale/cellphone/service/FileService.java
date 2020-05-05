package com.sale.cellphone.service;


import java.util.Map;

public interface FileService {
	
    public String readContentFromFile(String fileName);

    public String readEmailFromHtml(String filePath, Map<String, String> input);

    

}
