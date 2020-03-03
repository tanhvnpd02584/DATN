package com.tranquocdai.freshmarket.service;

import org.springframework.security.core.Authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TokenAuthenticationService {
    void addAuthentication(HttpServletResponse response, String username);

    Authentication getAuthentication(HttpServletRequest request);
}
