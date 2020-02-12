package model.dateChange;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateAdd {
	public static String getTimeString(int time) {  // time 单位为秒
		int miao = time % 60;
		int fen = time / 60;
		int hour = 0;
		if (fen >= 60) {
		hour = fen / 60;
		fen = fen % 60;
		}
		String timeString = "";
		String miaoString = "";
		String fenString = "";
		String hourString = "";
		if (miao < 10) {
		miaoString = "0" + miao;
		} else {
		miaoString = miao + "";
		}
		if (fen < 10) {
		fenString = "0" + fen;
		} else {
		fenString = fen + "";
		}
		if (hour < 10) {
		hourString = "0" + hour;
		} else {
		hourString = hour + "";
		}
		if (hour != 0) {
		timeString = hourString + ":" + fenString + ":" + miaoString;
		} else {
		timeString = fenString + ":" + miaoString;
		}
		return timeString;
		}

	public static String addbetween(String start,int between) {
	 SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
     SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     Date date1=null;
     Date date = null;
     String temp = getTimeString(between * 60);
		try {
			date = sdf.parse(temp);
			date1 = sdf1.parse(start);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(date.getTime()+28800000);
		System.out.println(sdf1.format(date1.getTime()+(date.getTime()+28800000)));
     return (sdf1.format(date1.getTime()+(date.getTime()+28800000)));
 }
    

}
