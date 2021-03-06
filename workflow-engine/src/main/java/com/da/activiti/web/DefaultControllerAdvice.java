package com.da.activiti.web;

import java.util.Map;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.Response;
import com.google.common.collect.Maps;

/**
 * Annotated ControllerAdvice bean that globally configures all other controllers with exception handling, bean binding, etc.
 *
 * @author Bill Studer
 * @see <a href="http://static.springsource.org/spring/docs/3.0.x/reference/mvc.html">Spring 3.x MVC Reference</a>
 */
@ControllerAdvice
public class DefaultControllerAdvice {

    private static final Logger LOG = LoggerFactory.getLogger(DefaultControllerAdvice.class);

//
//    @ExceptionHandler(InvalidAccessException.class)
//    @ResponseStatus(HttpStatus.FORBIDDEN)
//    public void handlePermissionException(InvalidAccessException ex) {
//        LOG.warn(ex.getMessage());
//    }


   /* *//**
     * With Ajax calls we need to send a 200 OK response with a status of success: false.
     *//*
    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
        LOG.error("Caught Exception - returning error response: {}", ex.getMessage());
        LOG.error("Root cause: {}", ExceptionUtils.getRootCauseMessage(ex));
        ex.printStackTrace();
        Map<String, Object> model = Maps.newHashMap();
        Response response = new Response(false, ex.getMessage() + "    Root Cause: " + ExceptionUtils.getRootCauseMessage(ex));
        model.put("response", response);
        return new ModelAndView("error", model);
        //return new ResponseEntity<Response>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    */
    
    /**
     * With Ajax calls we need to send a 200 OK response with a status of success: false.
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Response> handleException(Exception ex) {
        LOG.error("Caught Exception - returning error response: {}", ex.getMessage());
        LOG.error("Root cause: {}", ExceptionUtils.getRootCauseMessage(ex));
        ex.printStackTrace();
        Map<String, Object> model = Maps.newHashMap();
        Response response = new Response(false, ex.getMessage() + "    Root Cause: " + ExceptionUtils.getRootCauseMessage(ex));
        model.put("response", response);
        return new ResponseEntity<Response>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<Response> handleBusinessException(Exception ex) {
        LOG.error("Caught Exception - returning error response: {}", ex.getMessage());
        LOG.error("Root cause: {}", ExceptionUtils.getRootCauseMessage(ex));
        ex.printStackTrace();
        Map<String, Object> model = Maps.newHashMap();
        Response response = new Response(false, ex.getMessage() + "    Root Cause: " + ExceptionUtils.getRootCauseMessage(ex));
        model.put("response", response);
        return new ResponseEntity<Response>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
