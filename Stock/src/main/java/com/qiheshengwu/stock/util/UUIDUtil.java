package com.qiheshengwu.stock.util;

import org.springframework.stereotype.Component;

import java.util.UUID;

public class UUIDUtil {

    public static String getUUID() {

        return String.valueOf(UUID.randomUUID()).replaceAll("-","");

    }
}