package com.gzsb.root.gzsbroot.utils;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 类名称：DateUtil
 * 类描述：   时间操作工具
 * @version
 */
public class DateUtil {

    public static Date stringToDate(String str, String pattern){

        SimpleDateFormat sd = new SimpleDateFormat();
        sd.applyPattern(pattern);
        Date res = null;
        try {
            res = sd.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 生成ISO-8601 规范的时间格式
     * @param date
     * @return
     */
    public static String formatISO8601DateString(Date date){
        String pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
        return  DateFormatUtils.format(date, pattern);
    }



    /**
     * 获取原时间戳
     * @param reverseTime
     * @return
     */
    public static Long recoverReverseTime(Long reverseTime){
        long longTime = Long.MAX_VALUE - reverseTime;
        return longTime/1000000;
    }
    /**
     * 生成页面普通展示时间
     * @param date
     * @return
     */
    public static String formatNormalDateString(Date date){
        String pattern = "yyyy-MM-dd HH:mm:ss";
        return DateFormatUtils.format(date, pattern);
    }

    /**
     * 日期转换为字符串 yyyy-MM-dd
     *
     * @param date
     * @return
     */
    public static String getShotDate(Date date) {
        if (date == null){
            return "";
        }
        return dateStr(date, "yyyy-MM-dd");
    }

    /**
     * 日期转换为字符串 格式自定义
     *
     * @param date
     * @param f
     * @return
     */
    public static String dateStr(Date date, String f) {
        if (date == null){
            return "";
        }
        SimpleDateFormat format = new SimpleDateFormat(f);
        String str = format.format(date);
        return str;
    }

    /**
     * 获得当前日期
     * @return
     */
    public static Date getNow() {
        Calendar cal = Calendar.getInstance();
        Date currDate = cal.getTime();
        return currDate;
    }

    /**
     * 获得当前日期，精确到毫秒
     * @return
     */
    public static Timestamp getNowInMillis() {
        Timestamp timeStamep = new Timestamp(getNow().getTime());
        return timeStamep;
    }

    public static Date getDateByStrTime(String dateStr, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            return sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 计算两个日期之间相差的天数
     * @param date1
     * @param date2
     * @return  date1>date2时结果<0,  date1=date2时结果=0, date2>date1时结果>0
     */
    public static int daysBetween(Date date1, Date date2, String format){
        DateFormat sdf=new SimpleDateFormat(format);
        Calendar cal = Calendar.getInstance();
        try {
            Date d1 = sdf.parse(DateUtil.dateStr(date1, format));
            Date d2 = sdf.parse(DateUtil.dateStr(date2, format));
            cal.setTime(d1);
            long time1 = cal.getTimeInMillis();
            cal.setTime(d2);
            long time2 = cal.getTimeInMillis();
            return Integer.parseInt(String.valueOf((time2 - time1) / 86400000L));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 计算两个日期之间相差的小时数
     * @param date1
     * @param date2
     * @return
     */
    public static int hoursBetween(Date date1, Date date2) {
        DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        try {
            Date d1 = sdf.parse(DateUtil.dateStr(date1, "yyyyMMdd"));
            Date d2 = sdf.parse(DateUtil.dateStr(date2, "yyyyMMdd"));
            cal.setTime(d1);
            cal.setTime(d1);
            long time1 = cal.getTimeInMillis();
            cal.setTime(d2);
            long time2 = cal.getTimeInMillis();
            return Integer.parseInt(String.valueOf((time2 - time1) / 3600000L));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 计算两个日期相差的时间
     */
    public static void getBetweenDate () {
        String dateStart = "2017111520";
        String dateStop = "2017111620";
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHH");
        Date d1 = null;
        Date d2 = null;
        try {
            d1 = format.parse(dateStart);
            d2 = format.parse(dateStop);

            //毫秒ms
            long diff = d2.getTime() - d1.getTime();

            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);

            System.out.print("两个时间相差：");
            System.out.print(diffDays + " 天, ");
            System.out.print(diffHours + " 小时, ");
            System.out.print(diffMinutes + " 分钟, ");
            System.out.print(diffSeconds + " 秒.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /**
     * 计算两个日期之间相差的小时数
     * @param date1
     * @param date2
     * @return  date1>date2时结果<0,  date1=date2时结果=0, date2>date1时结果>0
     */
    public static int hoursBetweenByDateStr(Date date1, Date date2) {
        DateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
        Calendar cal = Calendar.getInstance();
        try {
            Date d1 = sdf.parse(DateUtil.dateStr(date1,"yyyyMMddHH"));
            Date d2 = sdf.parse(DateUtil.dateStr(date2,"yyyyMMddHH"));
            cal.setTime(d1);
            long time1 = cal.getTimeInMillis();
            cal.setTime(d2);
            long time2 = cal.getTimeInMillis();
            return Integer.parseInt(String.valueOf(((time2 - time1) / 3600000L)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 计算两个日期之间相差的分钟数
     * @param date1
     * @param date2
     * @return  date1>date2时结果<0,  date1=date2时结果=0, date2>date1时结果>0
     */
    public static int minuteBetweenByDateStr(Date date1, Date date2) {
        DateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
        Calendar cal = Calendar.getInstance();
        try {
            Date d1 = sdf.parse(DateUtil.dateStr(date1,"yyyyMMddHHmm"));
            Date d2 = sdf.parse(DateUtil.dateStr(date2,"yyyyMMddHHmm"));
            cal.setTime(d1);
            long time1 = cal.getTimeInMillis();
            cal.setTime(d2);
            long time2 = cal.getTimeInMillis();
            return Integer.parseInt(String.valueOf(((time2 - time1) / 60000L)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 计算两个日期之间相差的秒数
     * @param date1
     * @param date2
     * @return  date1>date2时结果<0,  date1=date2时结果=0, date2>date1时结果>0
     */
    public static int secondBetweenByDateStr(Date date1, Date date2) {
        DateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar cal = Calendar.getInstance();
        try {
            Date d1 = sdf.parse(DateUtil.dateStr(date1, "yyyyMMddHHmmss"));
            Date d2 = sdf.parse(DateUtil.dateStr(date2, "yyyyMMddHHmmss"));
            cal.setTime(d1);
            long time1 = cal.getTimeInMillis();
            cal.setTime(d2);
            long time2 = cal.getTimeInMillis();
            return Integer.parseInt(String.valueOf(((time2 - time1) / 1000L)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 获取当前日期前一天
     *
     * @return 2019-08-26
     */
    public static String getBeforeDay() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        date = calendar.getTime();
        return sdf.format(date);
    }


    /**
     * 获取最近七天
     *
     * @return 2019-08-20
     */
    public static String getServen() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c = Calendar.getInstance();

        c.add(Calendar.DATE, -7);

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        return preMonday;
    }

    /**
     * 获取最近一个月
     *
     * @return 2019-07-27
     */
    public static String getOneMonth() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c = Calendar.getInstance();

        c.add(Calendar.MONTH, -1);

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        return preMonday;
    }


    /**
     * 根据给的时间获取此月的最后一天
     * 传入参数为String，可传入：1、"201807"；2、"2018-07-01"
     * @param date
     * 			账期
     * @return String
     * 			当月的最后一天
     */
    public static String getLastDayByMonth(String date) {
        if (date.contains("-")) {
            date = date.replaceAll("-", "");
        } else if (date.length() < 6 || date.length() > 10) {
            System.out.println("日期错误！");
        }
        int year = Integer.parseInt(date.substring(0, 4));
        int month = Integer.parseInt(date.substring(4, 6));
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return new SimpleDateFormat("yyyy-MM-dd ").format(cal.getTime());
    }
    /**
     * 根据给的时间获取此月的第一天
     * 传入参数为String，可传入：1、"201807"；2、"2018-07-01"
     * @param date
     * 			账期
     * @return String
     * 			当月的第一天
     */
    public static String getFirstDayByMonth(String date) {
        if (date.contains("-")) {
            date = date.replaceAll("-", "");
        } else if (date.length() < 6 || date.length() > 10) {
            System.out.println("日期错误！");
        }
        int year = Integer.parseInt(date.substring(0, 4));
        int month = Integer.parseInt(date.substring(4, 6));
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DATE));
        return new SimpleDateFormat("yyyy-MM-dd ").format(cal.getTime());
    }

    /**
     * 判断当前时间是否在[startTime, endTime]区间，注意时间格式要一致
     *
     * @param nowTime 当前时间
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     * @author jqlin
     */
    public static boolean isEffectiveDate(Date nowTime, Date startTime, Date endTime) {
        if (nowTime.getTime() == startTime.getTime()
                || nowTime.getTime() == endTime.getTime()) {
            return true;
        }

        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);

        Calendar begin = Calendar.getInstance();
        begin.setTime(startTime);

        Calendar end = Calendar.getInstance();
        end.setTime(endTime);

        if (date.after(begin) && date.before(end)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 给时间增加几个小时
     * @param date
     * @param hour
     * @return
     */
    public static String addDateMinut(Date date, int hour,String pattern){
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        System.out.println("front:" + format.format(date)); //显示输入的日期
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR, hour);// 24小时制
        date = cal.getTime();
        System.out.println("after:" + format.format(date));  //显示更新后的日期
        cal = null;
        return format.format(date);

    }

}