package com.kanion.www.model;

/**
 * 
 * @author zhangsi
 *
 */
public class RsdExtraction {
	private String pinming;
	public String getPinming() {
		return pinming;
	}
	public void setPinming(String pinming) {
		this.pinming = pinming;
	}
	public String getPihao() {
		return pihao;
	}
	public void setPihao(String pihao) {
		this.pihao = pihao;
	}
	public String getZhongjianti() {
		return zhongjianti;
	}
	public void setZhongjianti(String zhongjianti) {
		this.zhongjianti = zhongjianti;
	}
	public double getPihaoValue() {
		return pihaoValue;
	}
	public void setPihaoValue(double pihaoValue) {
		this.pihaoValue = pihaoValue;
	}
	private String pihao;
	private String zhongjianti;
	private double pihaoValue; 
	
	
}
