package customclasses;

import java.io.File;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Locale;

public class AppConfig {
	
	private static int tablesize = 15;	
	private static String filePath = "E:\\ECOR\\UploadedDocuments";	
	private static String manualFilePath = "E:\\ECOR\\ManualDocuments";	
	public static String getFilePath()
	{
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
		Connection con = DBConnect.getConnection();
	}
}
