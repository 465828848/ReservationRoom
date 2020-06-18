package com.reservation.room.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Map;

/**
 * 提供一些对象有效性校验的方法
 */
@SuppressWarnings("rawtypes")
public final class CheckUtil {

    /**
     * 判断字符串是否是符合指定格式的时间
     * @param date 时间字符串
     * @param format 时间格式
     * @return 是否符合
     */
    public final static boolean isDate(String date,String format){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            sdf.parse(date);
            return true;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 判断字符串有效性
     */
    public final static boolean valid(String src) {
        return !(src == null || "".equals(src.trim()));
    }

    /**
     * 判断一组字符串是否有效
     * @param src
     * @return
     */
    public final static boolean valid(String... src) {
        for (String s : src) {
            if (!valid(s)) {
                return false;
            }
        }
        return true;
    }


    /**
     * 判断一个对象是否为空
     */
    public final static boolean valid(Object obj) {
        return !(null == obj);
    }

    /**
     * 判断一个对象是否为空
     */
    public final static boolean isNotValid(Object obj) {
        return null == obj;
    }

    /**
     * 判断一组对象是否有效
     * @param objs
     * @return
     */
    public final static boolean valid(Object... objs) {
        if (objs != null && objs.length != 0) {
            return true;
        }
        return false;
    }

    /**
     * 判断集合的有效性
     */
    public final static boolean valid(Collection col) {
        return !(col == null || col.isEmpty());
    }

    /**
     * 判断一组集合是否有效
     * @param cols
     * @return
     */
    public final static boolean valid(Collection... cols) {
        for (Collection c : cols) {
            if (!valid(c)) {
                return false;
            }
        }
        return true;
    }

    /**
     * 判断map是否有效
     * @param map
     * @return
     */
    public final static boolean valid(Map map) {
        return !(map == null || map.isEmpty());
    }

    /**
     * 判断一组map是否有效
     * @param maps 需要判断map
     * @return 是否全部有效
     */
    public final static boolean valid(Map... maps) {
        for (Map m : maps) {
            if (!valid(m)) {
                return false;
            }
        }
        return true;
    }
    /**
     * byte类型数组判断不为空
     * @param t
     * @return
     */
    public static boolean notEmpty(byte[] t){
        return t != null && t.length > 0;
    }

    /**
     * short类型数组不为空判断
     * @param t
     * @return
     */
    public static boolean notEmpty(short[] t){
        return t != null && t.length > 0;
    }

    /**
     * 数组判断不为空,没有泛型数组,所以还是分开写吧
     * @param t 可以是int,short,byte,String,Object,long
     * @return
     */
    public static boolean notEmpty(int[] t){
        return t != null && t.length > 0;
    }

    /**
     * long类型数组不为空
     * @param t
     * @return
     */
    public static boolean notEmpty(long[] t){
        return t != null && t.length > 0;
    }

    /**
     * String类型的数组不为空
     * @param t
     * @return
     */
    public static boolean notEmpty(String[] t){
        return t != null && t.length > 0;
    }

    /**
     * Object类型数组不为空
     * @param t
     * @return
     */
    public static boolean notEmpty(Object[] t){
        return t != null && t.length > 0;
    }

    /**
     *
     * @param o
     * @return
     */
    public static boolean notEmpty(Object o){
        return o != null && !"".equals(o) && !"null".equals(o);
    }
}
