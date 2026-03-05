package com.example.flower.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;

public final class PriceUtils {
    // 私有构造器防止实例化
    private PriceUtils() {}

    // 默认精度（保留2位小数）
    private static final int DEFAULT_SCALE = 2;
    private static final RoundingMode ROUNDING_MODE = RoundingMode.HALF_UP;

    /**
     * float 加法运算
     */
    public static float add(float a, float b) {
        return convertToFloat(
                new BigDecimal(Float.toString(a))
                        .add(new BigDecimal(Float.toString(b)))
        );
    }

    /**
     * double 加法运算
     */
    public static double add(double a, double b) {
        return convertToDouble(
                new BigDecimal(Double.toString(a))
                        .add(new BigDecimal(Double.toString(b)))
        );
    }

    /**
     * float 减法运算
     */
    public static float subtract(float a, float b) {
        return convertToFloat(
                new BigDecimal(Float.toString(a))
                        .subtract(new BigDecimal(Float.toString(b)))
        );
    }

    /**
     * double 减法运算
     */
    public static double subtract(double a, double b) {
        return convertToDouble(
                new BigDecimal(Double.toString(a))
                        .subtract(new BigDecimal(Double.toString(b)))
        );
    }

    // 辅助方法：BigDecimal 转 float 并控制精度
    private static float convertToFloat(BigDecimal value) {
        return value.setScale(DEFAULT_SCALE, ROUNDING_MODE)
                .floatValue();
    }

    // 辅助方法：BigDecimal 转 double 并控制精度
    private static double convertToDouble(BigDecimal value) {
        return value.setScale(DEFAULT_SCALE, ROUNDING_MODE)
                .doubleValue();
    }
}