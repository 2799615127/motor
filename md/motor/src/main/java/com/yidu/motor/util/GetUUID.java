/**
 * 
 */
/**
 * @author ÖÜÖ¾Ã÷
 *
 */
package com.yidu.motor.util;

import java.util.UUID;

public class GetUUID{
	private GetUUID(){
		
	}
	
	public static String getId(){
		String random=UUID.randomUUID().toString().replace("-","").substring(0,16);
		return random;
	}
	
	
	public static void main(String[] args) {
		for(int i=0;i<300;i++){
			
			System.out.println(GetUUID.getId());
			if(i%15==0){
				System.out.println("----------------------------------------");
			}
		}
		
	}
}