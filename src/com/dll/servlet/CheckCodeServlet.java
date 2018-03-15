package com.dll.servlet;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCodeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BufferedImage bufferedImage=new BufferedImage(70, 20, BufferedImage.TYPE_INT_BGR);
		StringBuilder sb=new StringBuilder(4);
		Graphics graphics = bufferedImage.getGraphics();
		graphics.setColor(new Color(200, 150, 255));
		graphics.fillRect(0, 0, 70, 20);
		Random random=new Random();
		graphics.setColor(new Color(random.nextInt(256),random.nextInt(256),random.nextInt(256)));
		char[] ch="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();
		for(int i=0;i<4;i++){
			int index=random.nextInt(ch.length);
			sb.append(ch[index]);
			graphics.drawString(String.valueOf(ch[index]), (i*15)+5, 15);
		}
		ImageIO.write(bufferedImage, "JPG", resp.getOutputStream());
		req.getSession().setAttribute("checkCode", sb.toString());
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);	
	}
}
