package model.dateChange;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import util.DBUtil;

/**
 * String ------------datetime(util) ---------------String 
 * 界面--------------------java--------------------------DB
 * 
 * datetime(SQL)------------datetime(util)-------------String
 *  DB------------------------java ----------------------界面
 * @author hp
 *
 */
public class DateChange {
	//把SQL.date 转换为util.date
	public Date sqlChangeToUtil (Timestamp datesql) {
		//System.out.println("sqlDate : " + sqlDate);
		System.out.println("datesql");
        Date date = new Date(datesql.getTime());//sql.Date转util.Date
        System.out.println("datesql");
        /*
        java.util.Date date = new java.util.Date(sqlDate.getTime());
         */
        System.out.println("utilDate : " + date);
		return date;
	}
	//把util.date转换为SQL.date 
	public Timestamp utilChangeToSql(Date dateUtil) {
	
	        Timestamp sqlDate = new Timestamp(dateUtil.getTime());
//	        Timestamp sqlDate = new Timestamp(dateUtil);//util.Date转sql.Date
	        System.out.println("sqlDate : " + sqlDate);
		return sqlDate;
	}
		
	//从网页传回的String转换为util.date
	public static Date strChangeToUtil (String dateStr) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateutil = null;
		try {
			dateutil = dateFormat.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dateutil;
	}
	//util.date转换为从网页传回的String
	public static String utilChangeToStr(Date dateutil) {		
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String stringDate = sdf.format(dateutil);
	        System.out.println("stringDate : " + stringDate);//输出结果 stringDate : 2018年01月12日
	        return stringDate;
	}

	public static void main(String[] args) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		GregorianCalendar gc1 =  new GregorianCalendar();
//		System.out.println(dateFormat.format(gc1.getTime()));
//		String datestring = "2018-02-03";
//		try {
//			GregorianCalendar gc2 = new GregorianCalendar();
//			gc2.setTime(dateFormat.parse(datestring));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Date date = new Date(19, 3, 2);
		utilChangeToStr(date);
		
		System.out.println(strChangeToUtil ("2019-06-22 00:00:00"));
	}
	
}
