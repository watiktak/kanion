/**
* Filename: UserController.java
* Project Name: kanion
* @author: cyz	imchyz(at)qq.com
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 MZStudio. All Rights Reserved
* Company: www.MZStudio.com
* Create at: 2014-8-24  下午5:17:46
* Description:
*
* Modification History:
* Date			Author		Version		Description
* ------------------------------------------------------------------
* 2014-8-24	cyz    		1.0			1.0 Version
*/
package com.kanion.www.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanion.www.model.User;
import com.kanion.www.service.UserService;

/**
 * @ClassName: UserController
 * @Description: TODO
 * @author CYZ	imchyz@qq.com
 * @date 2014-8-24 下午5:17:46
 *
 */
@Controller
@RequestMapping("userController")
public class UserController {
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService){
		this.userService=userService;
	}
	
	@RequestMapping("/addUser")
	public String addUser(User user){
		try{
			userService.addUser(user);
			return "success";
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping("/getUser")
	public String getUser(BigDecimal uid){
		try{
			userService.getUser(uid);
			return "success";
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "error";
	}
}
