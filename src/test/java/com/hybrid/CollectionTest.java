package com.hybrid;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionTest {
	List<String> color;
	Map<String,String> language;
	Set<String> locale;
	
	Log log = LogFactory.getLog(CollectionTest.class);
	
	public void setColor(List<String> color){
		this.color=color;
	}
	
	public void printColor(){
		for(String c:color){
			log.info("color="+c);
		}
	}
	
	public void setLanguage(Map<String,String> language){
		this.language=language;
	}

	public void printLanguage(){
		for(Entry<String,String> e : language.entrySet()){
			log.info(e.getKey()+"="+e.getValue());
		}
	}

	public void setlocale(Set<String> locale){
		this.locale=locale;
	}

	public void printlocale(){
		for(String l:locale){
			log.info("locale="+l);
		}
	}
	
	
	
	public static void main(String[] args) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("spring/beans1.xml");
		CollectionTest ct = ctx.getBean(CollectionTest.class);
		ct.printColor();
		System.out.println("");
		ct.printLanguage();
		System.out.println("");
		ct.printlocale();
		
		ctx.close();
	}
}
