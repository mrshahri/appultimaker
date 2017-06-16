package com.cpmc.ultimaker.controller;

import com.cpmc.ultikamer.model.ComponentOperation;
import com.cpmc.ultikamer.model.DeviceOperation;
import com.cpmc.ultikamer.model.Operations;
import com.google.gson.Gson;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created by Rakib on 5/25/2017.
 */
@Controller
public class AppController {

    private static int counter = 0;
    private static final String VIEW_INDEX = "index";
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(AppController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getAppPage(ModelMap model) {
        model.addAttribute("nextUrl", "http://uaf132854.ddns.uark.edu:8100/app-ultimaker/dashboard");
        return "index";
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String getDashboardPage(ModelMap model) {
        model.addAttribute("deviceOperationUrl",
                "http://uaf132854.ddns.uark.edu:8100/app-ultimaker/operate-device");
        model.addAttribute("componentOperationUrl",
                "http://uaf132854.ddns.uark.edu:8100/app-ultimaker/operate-component");
        return "dashboard";
    }

    @RequestMapping(value = "/operate-device", method = RequestMethod.GET)
    public String getUltimakerOperationPage(ModelMap model) {
        String operationsUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/probe?deviceId=Ultimaker01";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(operationsUrl);
        HttpResponse httpResponse = null;
        try {
            httpResponse = client.execute(httpGet);
            Gson gson = new Gson();
            String jsonString = IOUtils.toString(httpResponse.getEntity().getContent(), "UTF-8");
            Operations operations = gson.fromJson(jsonString, Operations.class);
            model.addAttribute("operations", operations.getDeviceOperations());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "device-operation";
    }

    @RequestMapping(value = "/operate-device", method = RequestMethod.POST)
    public String operateDevice(@RequestBody String jsonString) {
        String operationsUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/operate/device";
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(operationsUrl);
        try {
            httpPost.setEntity(new StringEntity(jsonString));
            HttpResponse response = client.execute(httpPost);
            return "success";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    @RequestMapping(value = "/operate-component", method = RequestMethod.GET)
    public String getUltimakerComponentOperationsPage(ModelMap model) {
        String operationsUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/probe?deviceId=Ultimaker01";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(operationsUrl);
        HttpResponse httpResponse = null;
        try {
            httpResponse = client.execute(httpGet);
            Gson gson = new Gson();
            String jsonString = IOUtils.toString(httpResponse.getEntity().getContent(), "UTF-8");
            Operations operations = gson.fromJson(jsonString, Operations.class);
            model.addAttribute("operations", operations.getComponentOperations());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "component-operation";
    }

    @RequestMapping(value = "/operate-component", method = RequestMethod.POST)
    public String operateUltimakerComponent(@RequestBody String jsonString) {
        String operationsUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/operate/component";
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(operationsUrl);
        try {
            httpPost.setEntity(new StringEntity(jsonString));
            HttpResponse response = client.execute(httpPost);
            return "success";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    @RequestMapping(value = "/device-parameters", method = RequestMethod.GET)
    public String getDeviceParametersPage(@RequestParam("operationId") String operationId, ModelMap model) {
        String probeUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/probe?deviceId=Ultimaker01";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(probeUrl);
        HttpResponse httpResponse = null;
        try {
            httpResponse = client.execute(httpGet);
            Gson gson = new Gson();
            String jsonString = IOUtils.toString(httpResponse.getEntity().getContent(), "UTF-8");
            Operations operations = gson.fromJson(jsonString, Operations.class);
            model.addAttribute("deviceId", "Ultimaker01");
            model.addAttribute("operationId", operationId);
            for (DeviceOperation operation : operations.getDeviceOperations()) {
                if (operationId.equals(operation.getOperationId())) {
                    model.addAttribute("parameters", operation.getParameters());
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("postUrl", "http://uaf132854.ddns.uark.edu:8100/app-ultimaker/operate-device");
        return "device-params-and-values";
    }

    @RequestMapping(value = "/component-parameters", method = RequestMethod.GET)
    public String getComponentParametersPage(@RequestParam("operationId") String operationId, ModelMap model) {
        String operationsUrl = "http://uaf132854.ddns.uark.edu:9002/virtualization-uark/probe?deviceId=Ultimaker01";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(operationsUrl);
        HttpResponse httpResponse = null;
        try {
            httpResponse = client.execute(httpGet);
            Gson gson = new Gson();
            String jsonString = IOUtils.toString(httpResponse.getEntity().getContent(), "UTF-8");
            Operations operations = gson.fromJson(jsonString, Operations.class);
            for (ComponentOperation operation : operations.getComponentOperations()) {
                if (operationId.equals(operation.getOperationId())) {
                    model.addAttribute("operation", operation);
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("postUrl", "http://uaf132854.ddns.uark.edu:8100/app-ultimaker/operate-component");
        return "component-params-and-values";
    }
}