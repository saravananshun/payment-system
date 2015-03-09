package com.onlinepayment.controller;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import net.webservicex.Currency;
import net.webservicex.CurrencyConvertorSoap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlinepayment.configuration.SpringMongoConfig;

@Controller
public class OnlinePaymentController {

	@Autowired
	private SpringMongoConfig mongoConfig;

	@RequestMapping("/")
	public String index() {
		System.out.println("Inside Index ");
		return "index";
	}

	@RequestMapping("/login")
	@ResponseBody
	public String login() {
		System.out.println("Inside Login ");
		return "{loginstatus:success}";
	}

	@RequestMapping("/home")
	public String home() {
		System.out.println("Inside Home ");
		return "home";
	}

	@RequestMapping("/initiatetransfer")
	public String initiateTransfer() {
		return "transfer";
	}

	@RequestMapping("/getCurrencyRate")
	@ResponseBody
	public String getConversionRate(
			@RequestParam("sourceCurrency") String sourceCurrency) {
		System.out.println("Received Source Currency " + sourceCurrency);
		URL url = null;
		try {
			url = new URL(
					"http://www.webservicex.net/CurrencyConvertor.asmx?WSDL");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		QName qname = new QName("http://www.webserviceX.NET/",
				"CurrencyConvertor");
		Service service = Service.create(url, qname);
		CurrencyConvertorSoap currencyConvertor = service
				.getPort(CurrencyConvertorSoap.class);
		return currencyConvertor.conversionRate(
				Currency.valueOf(sourceCurrency), Currency.INR)
				+ "";
	}
}