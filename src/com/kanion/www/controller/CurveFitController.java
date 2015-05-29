package com.kanion.www.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
/**
 * 
 * @author zhsi
 *
 */
@Controller
@RequestMapping("curvefit")
public class CurveFitController {
	private String fileName = "";
	private int pre = 0;
	private int fina = 0;
	private int dur = 0;
	

	@RequestMapping( "/addAction")
	@ResponseBody
	public String save(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value = "fileupload", required = false) MultipartFile filedata)throws UnsupportedEncodingException {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("application/text");
		if (filedata != null && !filedata.isEmpty()) {
			pre = (int) System.currentTimeMillis();
			fileName = filedata.getOriginalFilename();// 获取图片的文件名
			fina = saveFile(request, fileName, filedata);// 将图片上传到服务器
			dur = fina - pre;
			System.out.println("上传文件 " + fileName + " 耗时: " + dur);
		}
		System.out.println("fileName:"+fileName);
		return fileName;
	}

	private int saveFile(HttpServletRequest request, String newFileName,
			MultipartFile filedata) {
		int finalTime = 0;

		// 根据配置文件获取服务器图片存放路径
		String path = request.getSession().getServletContext().getRealPath("/");
		String saveFilePath = path;

		// 构建文件目录
		File tempFile = new File(saveFilePath);
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		// 保存文件到服务器
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(saveFilePath + "\\" + newFileName);
			fos.write(filedata.getBytes());
			fos.close();
			finalTime = (int) System.currentTimeMillis();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return finalTime;
	}
}
