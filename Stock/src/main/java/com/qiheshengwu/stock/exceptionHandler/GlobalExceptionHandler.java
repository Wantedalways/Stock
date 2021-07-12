package com.qiheshengwu.stock.exceptionHandler;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.exception.LoginException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Wantedalways
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = LoginException.class)
    @ResponseBody
    public Map<String,Object> doLoginException(Exception e) {

        Map<String,Object> exceptionMap = new HashMap<>(2);

        exceptionMap.put("success",false);
        exceptionMap.put("message",e.getMessage());

        return exceptionMap;

    }

    @ExceptionHandler(value = DMLException.class)
    @ResponseBody
    public Map<String,Object> doDMLException(Exception e) {

        Map<String,Object> exceptionMap = new HashMap<>(2);

        exceptionMap.put("success",false);
        exceptionMap.put("message",e.getMessage());

        return exceptionMap;
    }
}
