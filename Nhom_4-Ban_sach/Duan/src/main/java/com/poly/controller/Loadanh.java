package com.poly.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.sachDao;
import com.poly.service.CommonUtils;

import org.springframework.util.StreamUtils;

@Controller
public class Loadanh {
	@Autowired
	sachDao dao;
	@RequestMapping(value = "/ne", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public void getImg(HttpServletResponse response, @RequestParam("image") String image) throws IOException {
		File imgFile = new File(CommonUtils.IMAGE_FOLDER+"/"+image);
		@SuppressWarnings("resource")
		FileInputStream fis = new FileInputStream(imgFile);
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		StreamUtils.copy(fis.readAllBytes(), response.getOutputStream());
	}

}
