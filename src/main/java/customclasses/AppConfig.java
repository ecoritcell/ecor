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

import com.google.errorprone.annotations.CanIgnoreReturnValue;

import java.util.Locale;

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
		Connection con = DBConnect.getConnection();
	}
	
	public static String getFileNameForItemId(String itemid)	
	{
		String filename = "oqa";
		if(itemid.equalsIgnoreCase("1001"))
			filename = "HOUSING-POLICY";
		else if (itemid.equalsIgnoreCase("1002")) 
			filename = "RETENTION-PROVISION";
		else if (itemid.equalsIgnoreCase("1003")) 
			filename = "QUARTERS-IN-BBS";
		else if (itemid.equalsIgnoreCase("1004")) 
			filename = "REGISTRATION-FORM";
		else if (itemid.equalsIgnoreCase("1005")) 
			filename = "Rail-Kunj-Flat";
		else if (itemid.equalsIgnoreCase("1006")) 
			filename = "Rail-Kunj-Duplex";
		else if (itemid.equalsIgnoreCase("1007")) 
			filename = "Rail-Kutir";
		else if (itemid.equalsIgnoreCase("1008")) 
			filename = "Rail-Vihar-B-Type";
		else if (itemid.equalsIgnoreCase("1009")) 
			filename = "Rail-Vihar-C-Type";
		else if (itemid.equalsIgnoreCase("1010")) 
			filename = "Rail-Kunj-Type-VI";		
		else if (itemid.equalsIgnoreCase("1011")) 
			filename = "Rail-Kunj-Type-V";
		else if (itemid.equalsIgnoreCase("1012")) 
			filename = "Rail-Kunj-Type-IV-Spl";
		else if (itemid.equalsIgnoreCase("1013")) 
			filename = "Rail-Kutir-Type-V";
		else if (itemid.equalsIgnoreCase("1014")) 
			filename = "Rail-Vihar-B-Type";
		else if (itemid.equalsIgnoreCase("1015")) 
			filename = "Rail-Vihar-C-Type";
		else if (itemid.equalsIgnoreCase("1016")) 
			filename = "Transit-Flat";
		else if (itemid.equalsIgnoreCase("1017")) 
			filename = "JS-SS";
		else if (itemid.equalsIgnoreCase("1018")) 
			filename = "JAG-SG";
		else if (itemid.equalsIgnoreCase("1019")) 
			filename = "SAG-NF-HAG";
		else if (itemid.equalsIgnoreCase("1020")) 
			filename = "HAG";
		else if (itemid.equalsIgnoreCase("1021")) 
			filename = "RETENTION-LIST";
		
		
		
		return filename;
	}
}
