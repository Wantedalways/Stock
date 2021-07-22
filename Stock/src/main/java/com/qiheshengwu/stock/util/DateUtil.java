package com.qiheshengwu.stock.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * @author Wantedalways
 */
public class DateUtil {

    public static String getDate() {

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));

        return simpleDateFormat.format(date);

    }
    public static String getSimpleDate() {

        Date date = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));

        return simpleDateFormat.format(date);
    }

    public static int getSubtractDate(String startDate,String endDate) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));

        Date start = simpleDateFormat.parse(startDate);
        Date end = simpleDateFormat.parse(endDate);

        int result = 0;
        if (start != null && end != null) {

            result = Math.toIntExact(((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24)));

        }

        return result;
    }
}
