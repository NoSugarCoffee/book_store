package com.dll.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageSizeUtils {
	public static void resizeImage(String resImgPath,String distImgPath,int width,int height){
		File f=new File(resImgPath);
		Image srcImg=null;
		try {
			srcImg = ImageIO.read(new File(resImgPath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedImage bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		bufferedImage.getGraphics().drawImage(srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH),0,0,null);
		try {
			ImageIO.write(bufferedImage,"JPEG", new File(distImgPath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
