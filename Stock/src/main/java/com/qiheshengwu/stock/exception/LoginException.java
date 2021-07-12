package com.qiheshengwu.stock.exception;

import org.springframework.stereotype.Component;

/**
 * @author Wantedalways
 */
@Component
public class LoginException extends Exception{

    public LoginException() {
        super();
    }

    public LoginException(String message) {
        super(message);
    }
}
