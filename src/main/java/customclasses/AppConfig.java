package customclasses;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AppConfig {
	
	private static int tablesize = 15;	
	private static String filePath =  "";	
	private static String manualFilePath = "";	
	public static String getFilePath()
	{
		
		ConfigLoader config = new ConfigLoader();
		String isFileLive = config.getProperty("isFileLive");
		if(isFileLive.equalsIgnoreCase("YES")) {
			filePath = config.getProperty("live.uploaded.filepath");
		}else {
			filePath = config.getProperty("local.uploaded.filepath");
		}
		
		try {			
			File directory = new File(filePath);
			if (!directory.exists()) {
				if(directory.mkdirs()) {
					
					System.out.println("Directory Created Successfully");
				}
				else {
					filePath = "";
					System.out.println("Error occured while creating directory");
				}
				
		    }
			
		} catch (Exception e) {
			filePath = "";
			e.printStackTrace();
		}
		
		return filePath;
	}
	
	public static String getManualFilePath()
	{
		try {
			
			ConfigLoader config = new ConfigLoader();
			String isFileLive = config.getProperty("isFileLive");
			if(isFileLive.equalsIgnoreCase("YES")) {
				manualFilePath = config.getProperty("live.manual.filepath");
			}else {
				manualFilePath = config.getProperty("local.manual.filepath");
			}
			
			File directory = new File(manualFilePath);
			if (!directory.exists()) {
				if(directory.mkdirs()) {
					
					System.out.println("Directory Created Successfully");
				}
				else {
					manualFilePath = "";
					System.out.println("Error occured while creating directory");
				}
				
		    }
			
		} catch (Exception e) {
			manualFilePath = "";
			e.printStackTrace();
		}
		
		return manualFilePath;
	}
	
	public static Date convertStringToDate(String strDate)
	{
		Date date = null;
		if (strDate.length() > 0) {
			
			/*
			 * DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy",
			 * Locale.ENGLISH); LocalDate localDate = LocalDate.parse(strDate, formatter);
			 * date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			 */
			try {
			
				date = new SimpleDateFormat("dd-MM-yyyy").parse(strDate);
				System.out.println(date); 	

			}
			catch (Exception e) {
				// TODO: handle exception
				System.out.println("Unable to convert to Date.");
				System.out.println(e);
			}
			  
		}
		
		return date;
	}
	
	public static int getTableSize()
	{
		return tablesize;
	}
	
	public static void establishConnection()
	{
		 DBConnect.getConnection();
	}
	
	
	public static String getLastUpdateDate() {
	
		System.out.println("getLastUpdateDate called");
		  String lastUpdatedDateString = "";
		  try {
			
			  OqaUpdateDAO objOqaDao = new OqaUpdateDAO();
			  lastUpdatedDateString = objOqaDao.getLastUpdatedDate();	

			  
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		  
		  return lastUpdatedDateString;
	  
	  }	 
	
}
